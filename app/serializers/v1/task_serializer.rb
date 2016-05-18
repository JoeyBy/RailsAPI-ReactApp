module V1
  class TaskSerializer < ActiveModel::Serializer

    attributes :title, :body, :status, :due_date, :created_at, :abstract, :id
    has_one :user, serializer: V1::UserSerializer 
    
    def abstract
      object.body[0..200]
    end

  end
end

