defmodule Skyskool.Repo.Migrations.CreateSchools do
  use Ecto.Migration

  def change do
    create table(:schools) do
      add :name, :string
      add :email, :string

      timestamps()
    end

  end
end
