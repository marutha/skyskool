defmodule Skyskool.Repo.Migrations.CreateClass do
  use Ecto.Migration

  def change do
    create table(:class) do
      add :grade, :string
      add :section, :string
      add :school_id, references(:schools, on_delete: :nothing)
      timestamps()
    end

  end
end
