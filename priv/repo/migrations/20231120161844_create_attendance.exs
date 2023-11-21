defmodule Skyskool.Repo.Migrations.CreateAttendance do
  use Ecto.Migration

  def change do
    create table(:attendance) do
      add :attendance_date, :date
      add :attendance_type, :string
      add :student_id, references(:students, on_delete: :nothing)

      timestamps()
    end

  end
end
