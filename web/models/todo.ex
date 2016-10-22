defmodule Todo.Todo do
  use Todo.Web, :model

  schema "todos" do
    field :title, :string
    field :isdone, :boolean
    belongs_to :category, Todo.Categories

    timestamps
  end

  @required_fields ~w(title isdone)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
  def changest(model, category_id, params \\ :empty) do
      cast(changeset(model,params), %{category_id: category_id }, [:category_id])
  end
end
