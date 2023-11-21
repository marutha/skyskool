defmodule Skyskool.Schools.Attendance do
  use Ecto.Schema
  import Ecto.Changeset

  schema "attendance" do
    field :attendance_date, :date
    field :attendance_type, Ecto.Enum, values: ~w(fullday forenoon afternoon)a

    belongs_to :student, Skyskool.Schools.Student
    timestamps()
  end

  @doc false
  def changeset(attendance, attrs) do
    attendance
    |> cast(attrs, [:attendance_date, :attendance_type, :student_id])
    |> validate_required([:attendance_date, :attendance_type, :student_id])
  end
end
