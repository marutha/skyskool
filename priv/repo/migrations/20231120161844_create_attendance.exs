defmodule Skyskool.Repo.Migrations.CreateAttendance do
  use Ecto.Migration

  def change do
    create table(:attendance) do
      add :attendance_date, :date
      add :attendance_type, :string

      timestamps()
    end

  end
end
