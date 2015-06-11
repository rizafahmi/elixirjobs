defmodule ElixirJobs.UserController do
  use ElixirJobs.Web, :controller

  alias Exrethinkdb.Query
  alias ElixirJobs.Repo

  plug :action

  def new(conn, _params) do

    render conn, "new.html"
  end

  def create(conn, params) do

    IO.inspect params

    conn
    |> put_flash(:info, "Super! Your profile created.")
    |> redirect to: "/"
  end
end
