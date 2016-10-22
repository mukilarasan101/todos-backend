defmodule Todo.CategoryController do
  use Todo.Web, :controller

  alias Todo.Category

  plug :scrub_params, "category" when action in [:create, :update]

  def index(conn, _params) do
    query = from(c in Category, order_by: c.id);
    categories = Repo.all(query)
    render(conn, "index.json", categories: categories)
  end

  def create(conn, %{"category" => category_params}) do
    changeset = Category.changeset(%Category{}, category_params)

    case Repo.insert(changeset) do
      {:ok, category} ->
        Todo.Endpoint.broadcast "pushchanges:lobby" , "new:msg", %{type: "category", data: %{category: %{title: category.title, id: category.id, description: category.description}}, operation: "new"}
        conn
        |> put_status(:created)
        |> put_resp_header("location", category_path(conn, :show, category))
        |> render("show.json", category: category)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Todo.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    category = Repo.get!(Category, id)
    render(conn, "show.json", category: category)
  end

  def update(conn, %{"id" => id, "category" => category_params}) do
    category = Repo.get!(Category, id)
    changeset = Category.changeset(category, category_params)

    case Repo.update(changeset) do
      {:ok, category} ->
        Todo.Endpoint.broadcast "pushchanges:lobby" , "new:msg", %{type: "category", data: %{category: %{title: category.title, id: category.id, description: category.description}}, operation: "edit"}
        render(conn, "show.json", category: category)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Todo.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    category = Repo.get!(Category, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(category)
    Todo.Endpoint.broadcast "pushchanges:lobby" , "new:msg", %{type: "category", data: %{category: %{title: category.title, id: category.id, description: category.description}}, operation: "delete"}
    render(conn, "show.json", category: category)
  end
end
