defmodule Todo.TodoView do
  use Todo.Web, :view

  def render("index.json", %{todos: todos}) do
    %{todo: render_many(todos, Todo.TodoView, "todo.json")}
  end

  def render("show.json", %{todo: todo}) do
    %{todo: render_one(todo, Todo.TodoView, "todo.json")}
  end

  def render("todo.json", %{todo: todo}) do
    %{id: todo.id,
      title: todo.title,
      category_id: todo.category_id,
      isdone: todo.isdone}
  end
end
