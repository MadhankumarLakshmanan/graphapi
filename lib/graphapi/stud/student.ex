defmodule Graphapi.Stud.Student do
  use Ecto.Schema
  import Ecto.Changeset

  schema "students" do

    field :name, :string
    field :status, :string
    field :department, :string

    timestamps()
  end

  @spec changeset(
          {map, map}
          | %{
              :__struct__ => atom | %{:__changeset__ => map, optional(any) => any},
              optional(atom) => any
            },
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(student, attrs) do
    student
    |> cast(attrs, [:name, :status, :department])
    |> validate_required([:name, :status, :department])
  end
end
