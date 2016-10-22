defmodule Todo.TodoController do
  use Todo.Web, :controller

  alias Todo.Endpoint
  alias Todo.Todo

  plug :scrub_params, "todo" when action in [:create, :update]

  def index(conn, %{"category_id" => category_id}) do
    query = from(t in Todo, where: t.category_id == ^category_id, order_by: t.id)
    todos = Repo.all(query);
    render(conn, "index.json", todos: todos)
  end

  def create(conn, %{"todo" => todo_params,"category_id" => category_id}) do
    changeset = Todo.changest(%Todo{}, category_id , todo_params);
    case Repo.insert(changeset) do
      {:ok, todo} ->
        Endpoint.broadcast "pushchanges:lobby" , "new:msg", %{type: "todo", data: %{todo: %{title: todo.title, id: todo.id, category_id: todo.category_id, isdone: todo.isdone}},operation: "new"}
        conn
        |> put_status(:created)
        |> render("show.json", todo: todo)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Todo.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id,"category_id" => category_id}) do
    todo = Repo.get!(Todo, id)
    render(conn, "show.json", todo: todo)
  end

  def update(conn, %{"id" => id, "todo" => todo_params,"category_id" => category_id}) do
    todo = Repo.get!(Todo, id)
    changeset = Todo.changeset(todo, todo_params)

    case Repo.update(changeset) do
      {:ok, todo} ->
        Endpoint.broadcast "pushchanges:lobby" , "new:msg", %{type: "todo", data: %{todo: %{title: todo.title, id: todo.id, category_id: todo.category_id, isdone: todo.isdone}},operation: "edit"}
        render(conn, "show.json", todo: todo)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Todo.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id,"category_id" => category_id}) do
    todo = Repo.get!(Todo, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(todo)
    Endpoint.broadcast "pushchanges:lobby" , "new:msg", %{type: "todo", data: %{todo: %{title: todo.title, id: todo.id, category_id: todo.category_id, isdone: todo.isdone}},operation: "delete"}
    send_resp(conn, :no_content, "")
  end
end
