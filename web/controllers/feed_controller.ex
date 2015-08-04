defmodule ElixirJobs.FeedController do
  use ElixirJobs.Web, :controller
  use Timex

  alias Exrethinkdb.Query
  alias ElixirJobs.Repo

  @title "ElixirDose Jobs"
  @baseurl "http://jobs.elixirdose.com"
  @description "Elixir Jobs is the best place to find, list jobs and developer community space specifically for Elixir Programming Language."
  @lang "en-us"

  defp format_rfc(date) do
    date |> DateFormat.format!("%a, %d %b %Y %H:%M:%S %z", :strftime)
  end

  defp job_to_rss_item(job) do
    date = job["date_created"] |> Date.from(:secs, :epoch)
                               |> format_rfc

    RSS.item(
      job["title"],
      job["description"],
      date,
      "#{@baseurl}/job/#{job["id"]}",
      job["id"]
    )
  end

  def index(conn, _params) do
    date = Date.now |> format_rfc

    channel = RSS.channel(
      @title,
      @baseurl,
      @description,
      date,
      "lang (#{@lang})"
    )

    items = Query.table("jobs") |> Repo.run
                                |> Map.get(:data)
                                |> Enum.map(&job_to_rss_item(&1))

    conn |> put_resp_content_type("application/xml")
         |> text(RSS.feed(channel, items))
  end
end
