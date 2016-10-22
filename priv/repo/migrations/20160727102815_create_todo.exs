defmodule Todo.Repo.Migrations.CreateTodo do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :title, :string
      add :isdone , :boolean
      add :category_id, references(:categories, on_delete: :delete_all)

      timestamps
    end
    create index(:todos, [:category_id])

  end
end
