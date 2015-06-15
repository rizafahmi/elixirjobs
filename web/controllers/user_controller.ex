defmodule ElixirJobs.UserController do
  use ElixirJobs.Web, :controller

  alias Exrethinkdb.Query
  alias ElixirJobs.Repo

  plug :attach_sessions
  plug :authenticate when action in [:new_profile, :edit_profile]
  plug :action

  def login(conn, _params) do

    render conn, "login.html"
  end

  def create(conn, params) do

    hash_password = Comeonin.Bcrypt.hashpwsalt(params["password"])

    user = %{
      email: params["email"],
      password: hash_password

      }

    q = Query.table("users")
    |> Query.insert(user)
    Repo.run(q)

    conn
    |> put_flash(:info, "Super! Your account created.")
    |> redirect to: "/"
  end

  def process_login(conn, params) do
    if is_nil(do_login(params["email"], params["password"])) do
      conn
      |> put_flash(:error, "Login failed") |> redirect(to: "/users/login") |> halt
    else
      conn = put_session(conn, :user, params["email"])
      conn
        |> put_flash(:info, "Thanks for logging in!") |> redirect(to: "/")
    end
  end

  def do_login(email, password) do
    q = Query.table("users")
    |> Query.filter(%{email: email})

    user = Repo.run(q).data |> List.first

    if Comeonin.Bcrypt.checkpw(password, user["password"]) do
      user
    else
      nil
    end


  end

  def logout(conn, _params) do
    conn = delete_session(conn, :user)
    conn |> put_flash(:info, "You're logged out!") |> redirect(to: "/")
  end

  def new_profile(conn, _params) do
    render conn, "new_profile.html"
  end

  def create_profile(conn, params) do

    dev = %{
      name: params["name"],
      short_desc: params["short_desc"],
      description: params["description"],
      picture_url: params["picture_url"],
      interest_fulltime: params["fulltime"],
      interest_hourly: params["hourly"],
      interest_term: params["term"],
      interest_mentoring: params["mentoring"],
      interest_volunteer: params["volunteer"],
      interest_other: params["other"],
      location: params["location"],
      website: params["website"],
      resume_url: params["resume_url"],
      github_url: params["github_url"],
      linkedin_url: params["linkedin_url"],
      twitter_url: params["twitter_url"],
      email: get_session(conn, :user)
      }


    q = Query.table("devs")
      |> Query.insert(dev)

    Repo.run(q)


    conn
    |> put_flash(:info, "Super! Your profile added.")
    |> redirect to: "/"

  end

  def edit_profile(conn, _params) do
    q = Query.table("devs")
      |> Query.filter(%{email: get_session(conn, :user)})

    profile = Repo.run(q).data |> List.first

    conn
      |> assign(:profile, profile)
      |> render "edit_profile.html"

  end

  def update_profile(conn, params) do
    dev = %{
      name: params["name"],
      short_desc: params["short_desc"],
      description: params["description"],
      picture_url: params["picture_url"],
      interest_fulltime: params["fulltime"],
      interest_hourly: params["hourly"],
      interest_term: params["term"],
      interest_mentoring: params["mentoring"],
      interest_volunteer: params["volunteer"],
      interest_other: params["other"],
      location: params["location"],
      website: params["website"],
      resume_url: params["resume_url"],
      github_url: params["github_url"],
      linkedin_url: params["linkedin_url"],
      twitter_url: params["twitter_url"],
      }

    q = Query.table("devs")
      |> Query.filter(%{email: get_session(conn, :user)})
      |> Query.update(dev)

    Repo.run(q)

    conn
    |> put_flash(:info, "Super! Your profile updated.")
    |> redirect to: "/"

    conn
  end


  # Private Room
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
