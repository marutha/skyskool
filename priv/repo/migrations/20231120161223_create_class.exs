defmodule Skyskool.Repo.Migrations.CreateClass do
  use Ecto.Migration

  def change do
    create table(:class) do
      add :grade, :string
      add :section, :string

      timestamps()
    end

  end
end
