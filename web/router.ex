defmodule Todo.Router do
  use Todo.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Todo do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api/v1", Todo do
    pipe_through :api
    resources "/categories", CategoryController, except: [:new, :edit] do
      resources "/todos", TodoController, except: [:new, :edit]
    end
    resources "/category", CategoryController, except: [:new, :edit] do
      resources "/todos", TodoController, except: [:new, :edit]
    end
  end
end
