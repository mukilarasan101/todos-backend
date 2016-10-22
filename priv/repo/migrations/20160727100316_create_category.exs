defmodule Todo.Repo.Migrations.CreateCategory do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :title, :string
      add :description, :string, size: 4000
      timestamps
    end

  end
end
