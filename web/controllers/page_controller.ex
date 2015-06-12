defmodule ElixirJobs.PageController do
  use ElixirJobs.Web, :controller

  alias Exrethinkdb.Query
  alias ElixirJobs.Repo

  plug :authenticate when action in [:new]
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
    |> assign(:job, hd(result.data))
    |> render("show.html")
  end

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, params) do
    job = %{
      title: params["title"],
      company: params["company"],
      description: params["description"],
      email: params["email"],
      job_type: params["job_type"],
      location: params["location"],
      job_status: params["job_status"],
      logo: params["logo"]
      }

    q = Query.table("jobs")
    |> Query.insert(job)
    Repo.run(q)

    conn
    |> put_flash(:info, "Yay! Job posted!!") 
    |> redirect to: "/"
  end

  defp authenticate(conn, _params) do
    if is_nil(ElixirJobs.UserController.do_login(conn.assigns[:email], conn.assigns[:password])) do
      conn |> put_flash(:info, "Please do login first.") |> redirect(to: "/") |> halt
    else
      conn
    end
  end

end
