defmodule Skyskool.Schools.Class do
  use Ecto.Schema
  import Ecto.Changeset

  schema "class" do
    field :grade, :string
    field :section, :string
    belongs_to :school, Skyskool.Schools.School

    timestamps()
    has_many :student, Skyskool.Schools.Student
  end

  @doc false
  def changeset(class, attrs) do
    class
    |> cast(attrs, [:grade, :section])
    |> validate_required([:grade, :section])
  end
end
