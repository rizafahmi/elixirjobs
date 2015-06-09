defmodule ElixirJobs.PageController do
  use ElixirJobs.Web, :controller

  alias Exrethinkdb.Query
  alias ElixirJobs.Repo

  plug :action
  plug :render

  def index(conn, _params) do

    q = Query.table("jobs")
    jobs = Repo.run(q)

    devs = [
       %{"id" => 3, "name" => "Steve Jobes", "description" => "Steve Jobes is a fictional character designed to resemble someone familiar to readers.",
         "picture" => "steve.jpg", "location" => "Cupertino"
         },
       %{"id" => 4, "name" => "Veronika Ossi", "description" => "Living in New York who enjoys kittens, music, and partying.",
         "picture" => "geek.jpg"},
     ]

    q = Query.table("devs")
    devs = Repo.run(q)

    conn
    |> assign(:jobs, jobs.data)
    |> assign(:devs, devs.data)
  end

  def show(conn, %{"id" => id}) do
    IO.inspect id
    q = Query.table("jobs")
      |> Query.filter(%{id: id})

    result = Repo.run q

    assign conn, :job, hd(result.data)
  end
end
