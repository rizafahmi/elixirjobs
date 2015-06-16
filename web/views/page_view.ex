defmodule ElixirJobs.PageView do
  use ElixirJobs.Web, :view

  def convert_date(epoch_time) do
    epoch_time
  end

  def to_html(text) do
    raw Earmark.to_html(text)
  end
end
