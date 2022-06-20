defmodule GraphapiWeb.Schema do
  use Absinthe.Schema

  alias GraphapiWeb.StudentResolver

  object :student do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :status, non_null(:string)
    field :department, non_null(:string)
  end


  query do
    @desc "Get all students"
    field :all_students, non_null(list_of(non_null(:student))) do
      resolve(&StudentResolver.all_students/3)
    end
  end

  mutation do

    @desc "Create a new student"
    field :create_student, :student do
      arg :name, non_null(:string)
      arg :status, non_null(:string)
      arg :department, non_null(:string)


      resolve &StudentResolver.create_student/3
    end

    @desc "Delete an student"
    field :delete_student, :student do
      arg :id, non_null(:id)

      resolve &StudentResolver.delete_student/3
    end

    @desc "Update an student status"
    field :update_student_status, :student do
      arg :id, non_null(:id)
      arg :status, non_null(:string)
      arg :department, non_null(:string)

      resolve &StudentResolver.update_student_status/3
    end
  end
end
