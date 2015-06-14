defmodule ElixirJobs.Router do
  use ElixirJobs.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElixirJobs do
    pipe_through :browser # Use the default browser stack

    # resources "/", PageController
    get "/", PageController, :index
    get "/job/new", PageController, :new
    get "/job/:id", PageController, :show
    post "/job", PageController, :create

    get "/users/login", UserController, :login
    post "/users/process_login", UserController, :process_login
    post "/users", UserController, :create
    get "/users/new_profile", UserController, :new_profile
    get "/users/edit_profile", UserController, :edit_profile
    post "/users/profile", UserController, :create_profile
    post "/users/edit_profile", UserController, :edit_profile
    get "/users/logout", UserController, :logout

    get "/dev/:id", DevController, :show

  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirJobs do
  #   pipe_through :api
  # end
end
