module V1
  class TasksController < ApplicationController
    skip_before_action :authenticate_user_from_token!, only: [:index, :show]
    
    # GET /v1/stories
    # Get all the tasks
    def index
      @tasks = Task.includes(:user).order(due_date: :asc).all
      render json: @tasks, each_serializer: TasksSerializer
    end

    def show
      @task = Task.find(params[:id])
      render json: @task, serializer: TaskSerializer
    end

    # POST /v1/stories
    # Add a new task
    def create
      @task = Task.new(task_params)

      if @task.save
        render json: @task, serializer: TaskSerializer
      else
        render json: { error: t('task_create_error') }, status: :unprocessable_entity
      end
    end
    
    private

    def task_params
      params.require(:task).permit(:title, :body, :status, :due_date).merge(user: current_user)
    end

  end
end

