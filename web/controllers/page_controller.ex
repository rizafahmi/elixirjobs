defmodule ElixirJobs.PageController do
  use ElixirJobs.Web, :controller

  plug :action
  plug :render

  def index(conn, _params) do
    jobs = [
      %{"id" => 1, "title" => "Ruby Developer", "company" => "Android Authority",
        "logo" => "android_autority.png"},
      %{"id" => 2, "title" => "Elixir Developer", "company" => "ElixirDose"
        }
    ]
    assign conn, :jobs, jobs
  end

  def show(conn, %{"id" => id}) do
    IO.inspect id
    assign conn, :id, id
  end
end
