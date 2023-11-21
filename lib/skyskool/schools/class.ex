defmodule Skyskool.Schools.Class do
  use Ecto.Schema
  import Ecto.Changeset

  schema "class" do
    belongs_to :school, Skyskool.Schools.School
    field :grade, :string
    field :section, :string

    timestamps()
    has_many :student, Skyskool.Schools.Student
  end

  @doc false
  def changeset(class, attrs) do
    class
    |> cast(attrs, [:grade, :section, :school_id])
    |> validate_required([:grade, :section, :school_id])
  end
end
