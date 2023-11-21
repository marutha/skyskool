defmodule Skyskool.Repo.Migrations.CreateStudents do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :name, :string
      add :dob, :date
      add :email, :string
      add :class_id, references(:class, on_delete: :nothing)

      timestamps()
    end

  end
end
