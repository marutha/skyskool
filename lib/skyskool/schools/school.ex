defmodule Skyskool.Schools.School do
  use Ecto.Schema
  import Ecto.Changeset

  schema "schools" do
    field :email, :string
    field :name, :string

    timestamps()
    has_many :class, Skyskool.Schools.Class
  end

  @doc false
  def changeset(school, attrs) do
    school
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
  end
end
