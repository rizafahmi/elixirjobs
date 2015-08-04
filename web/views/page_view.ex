defmodule ElixirJobs.PageView do
  use ElixirJobs.Web, :view
  use Timex

  def convert_date(epoch_time) do
    epoch_time |> Date.from(:secs, :epoch)
               |> DateFormat.format!("%Y-%m-%d", :strftime)
  end

  def to_html(text) do
    raw Earmark.to_html(text)
  end
end
