defmodule ElixirJobs.PageControllerTest do
  use ElixirJobs.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "ElixirDose Jobs"
  end
end
