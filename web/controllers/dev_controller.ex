defmodule ElixirJobs.DevController do
  use ElixirJobs.Web, :controller

  alias Exrethinkdb.Query
  alias ElixirJobs.Repo

  plug :authenticate when action in [:show]
  plug :attach_sessions
  plug :action
  plug :render

  def show(conn, %{"id" => id}) do
    q = Query.table("devs")
      |> Query.filter(%{id: id})

    result = Repo.run q

    assign conn, :dev, hd(result.data)
  end

  defp authenticate(conn, _params) do
    if is_nil(get_session(conn, :user)) do
        conn |> put_flash(:error, "You need to login first") |> redirect(to: "/users/login") |> halt
    else
      conn
    end
  end

  defp attach_sessions(conn, _params) do
    conn |> assign(:user, get_session(conn, :user))
  end
end
