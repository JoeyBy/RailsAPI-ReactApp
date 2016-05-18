module V1
  class TasksSerializer < ActiveModel::Serializer
    
    attributes :title, :created_at, :status, :due_date, :abstract, :id
    has_one :user, serializer: V1::UserSerializer

    def abstract
      object.body[0..200]
    end

  end
end

