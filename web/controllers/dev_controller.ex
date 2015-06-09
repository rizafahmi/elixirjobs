defmodule ElixirJobs.DevController do
  use ElixirJobs.Web, :controller

  alias Exrethinkdb.Query
  alias ElixirJobs.Repo

  plug :action
  plug :render

  def show(conn, %{"id" => id}) do
    IO.inspect id
    q = Query.table("devs")
      |> Query.filter(%{id: id})

    result = Repo.run q

    assign conn, :dev, hd(result.data)
  end
end
