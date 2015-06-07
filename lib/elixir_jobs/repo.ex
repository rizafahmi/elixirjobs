defmodule ElixirJobs.Repo do
  def start_link do
    conn = Exrethinkdb.local_connection
    Agent.start_link(fn -> conn end, name: __MODULE__)
    {:ok, self}
  end

  def run(query) do
    Agent.get(__MODULE__, fn conn ->
      Exrethinkdb.run conn, query
    end)
  end

end
