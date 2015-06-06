defmodule ElixirJobs.PageController do
  use ElixirJobs.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
