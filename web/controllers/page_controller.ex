defmodule ElixirJobs.PageController do
  use ElixirJobs.Web, :controller

  alias Exrethinkdb.Query
  alias ElixirJobs.Repo

  plug :action

  def index(conn, _params) do

    q = Query.table("jobs")
    jobs = Repo.run(q)

    q = Query.table("devs")
    devs = Repo.run(q)

    conn
    |> assign(:jobs, jobs.data)
    |> assign(:devs, devs.data)
    |> render("index.html")
  end

  def show(conn, %{"id" => id}) do
    q = Query.table("jobs")
      |> Query.filter(%{id: id})

    result = Repo.run q

    conn
    |> assign :job, hd(result.data)
    |> render "show.html"
  end

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, params) do
    job = %{title: params["title"]}
    IO.inspect job
    conn
    |> put_flash(:info, "Yay! Job posted!!") 
    |> redirect to: "/"
  end
end
