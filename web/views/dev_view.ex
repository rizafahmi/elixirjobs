defmodule ElixirJobs.DevView do
  use ElixirJobs.Web, :view

  def to_html(text) do
    raw Earmark.to_html(text)
  end
end
