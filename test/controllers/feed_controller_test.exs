defmodule ElixirJobs.FeedControllerTest do
  use ElixirJobs.ConnCase

  test "GET /feed" do
    conn = get conn(), "/feed"
    assert response_content_type(conn, :xml) =~ "charset=utf-8"
    assert response(conn, 200) =~ "<![CDATA["
    assert response(conn, 200) =~ "]]>"
  end
end
