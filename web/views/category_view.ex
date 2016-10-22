defmodule Todo.CategoryView do
  use Todo.Web, :view

  def render("index.json", %{categories: categories}) do
    %{category: render_many(categories, Todo.CategoryView, "category.json")}
  end

  def render("show.json", %{category: category}) do
    %{category: render_one(category, Todo.CategoryView, "category.json")}
  end

  def render("category.json", %{category: category}) do
    %{id: category.id,
      title: category.title,
      description: category.description}
  end
end
