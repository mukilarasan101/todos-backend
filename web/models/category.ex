defmodule Todo.Category do
  use Todo.Web, :model

  schema "categories" do
    field :title, :string
    field :description, :string, size: 4000
    timestamps
  end

  @required_fields ~w(title)
  @optional_fields ~w(description)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
