defmodule GraphapiWeb.StudentResolver do
  alias Graphapi.Stud

  def all_students(_root, _args, _info) do
    {:ok, Stud.list_students()}
  end


  def create_student(_root, args, _info) do
    case Stud.create_student(args) do
      {:ok, student} ->
        {:ok, student}
      _error ->
        {:error, "could not create student"}
    end
  end

  @spec delete_student(any, %{:id => any, optional(any) => any}, any) ::
          {:error, <<_::192>>} | {:ok, any}
  def delete_student(_root, %{id: id}, _info) do
    student = Stud.get_student!(id)
    case Stud.delete_student(student) do
      {:ok, student} ->
        {:ok, student}
      _error ->
        {:error, "could not delete student"}
    end
  end

  @spec update_student_status(any, %{:id => any, :status => any, :department => any, optional(any) => any}, any) ::
          {:error, <<_::192>>} | {:ok, any}
  def update_student_status(_root, %{id: id, status: status, department: department}, _info) do
    student = Stud.get_student!(id)
    case Stud.update_student(student,%{status: status,department: department}) do
      {:ok, student} ->
        {:ok, student}
      _error ->
        {:error, "could not update student"}
    end
  end
end
