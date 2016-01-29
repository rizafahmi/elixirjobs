defmodule ElixirJobs.Router do
  use ElixirJobs.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :rss do
    plug :accepts, ["rss"]
  end

  scope "/", ElixirJobs do
    pipe_through :browser # Use the default browser stack

    get  "/", PageController, :index
    post "/jobs/:id", PageController, :update
    resources "/jobs", PageController, except: [:update]

    get  "/users/login", UserController, :login
    post "/users/process_login", UserController, :process_login
    get  "/users/logout", UserController, :logout

    post "/users", UserController, :create
    get  "/users/new_profile", UserController, :new_profile
    get  "/users/edit_profile", UserController, :edit_profile
    post "/users/profile", UserController, :create_profile
    post "/users/edit_profile", UserController, :update_profile

    get  "/dev/:id", DevController, :show
  end

  scope "/feed", ElixirJobs do
    pipe_through :rss # Use the rss stack

    get "/", FeedController, :index
  end
end
