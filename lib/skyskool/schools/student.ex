defmodule Skyskool.Schools.Student do
  use Ecto.Schema
  import Ecto.Changeset

  schema "students" do
    field :dob, :date
    field :email, :string
    field :name, :string

    belongs_to :class, Skyskool.Schools.Class

    timestamps()
    has_many :attendance, Skyskool.Schools.Attendance
  end

  @doc false
  def changeset(student, attrs) do
    student
    |> cast(attrs, [:name, :dob, :email])
    |> validate_required([:name, :dob, :email])
  end
end
