defmodule ElixirJobs.PageController do
  use ElixirJobs.Web, :controller

  alias Exrethinkdb.Query
  alias ElixirJobs.Repo

  plug :action
  plug :render

  def index(conn, _params) do

    q = Query.table("jobs")
    jobs = Repo.run(q)

    q = Query.table("devs")
    devs = Repo.run(q)

    conn
    |> assign(:jobs, jobs.data)
    |> assign(:devs, devs.data)
  end

  def show(conn, %{"id" => id}) do
    q = Query.table("jobs")
      |> Query.filter(%{id: id})

    result = Repo.run q

    assign conn, :job, hd(result.data)
  end

  def new(conn, _params) do
    conn
  end

  def create(conn, _params) do
    IO.inspect "POSTED!"

    conn
  end
end
