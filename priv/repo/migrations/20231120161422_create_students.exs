defmodule Skyskool.Repo.Migrations.CreateStudents do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :name, :string
      add :dob, :date
      add :email, :string

      timestamps()
    end

  end
end
