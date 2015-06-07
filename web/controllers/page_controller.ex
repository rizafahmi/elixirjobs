defmodule ElixirJobs.PageController do
  use ElixirJobs.Web, :controller

  alias Exrethinkdb.Query
  alias ElixirJobs.Repo

  plug :action
  plug :render

  def index(conn, _params) do

    q = Query.table("jobs")
    result = Repo.run(q)

    assign conn, :jobs, result.data
  end

  def show(conn, %{"id" => id}) do
    IO.inspect id
    q = Query.table("jobs")
      |> Query.filter(%{id: id})

    result = Repo.run q
    # job = hd(result)
    IO.inspect result

    assign conn, :job, hd(result.data)
  end
end
