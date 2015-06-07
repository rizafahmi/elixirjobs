defmodule ElixirJobs.PageController do
  use ElixirJobs.Web, :controller

  alias Exrethinkdb.Query
  alias ElixirJobs.Repo

  plug :action
  plug :render

  def index(conn, _params) do
    jobs = [
      %{"id" => 1, "title" => "Ruby Developer", "company" => "Android Authority",
        "logo" => "android_autority.png"},
      %{"id" => 2, "title" => "Elixir Developer", "company" => "ElixirDose"
        }
    ]

    q = Query.table("jobs")
    result = Repo.run(q)

    assign conn, :jobs, result.data
  end

  def show(conn, %{"id" => id}) do
    IO.inspect id
    assign conn, :id, id
  end
end
