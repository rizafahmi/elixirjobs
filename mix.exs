defmodule ElixirJobs.Mixfile do
  use Mix.Project

  def project do
    [app: :elixir_jobs,
     version: "0.0.1",
     elixir: "~> 1.1.1",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [mod: {ElixirJobs, []},
     applications: [:phoenix, :phoenix_html, :cowboy, :logger, :comeonin]]
  end

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [{:phoenix, "~> 1.0.3"},
     {:phoenix_html, "~> 2.0"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:cowboy, "~> 1.0"},
     {:exrethinkdb, github: "hamiltop/exrethinkdb", ref: "55fb5b5ed892f28b7ae8ee1b2f8e54fb651bd611"},
     {:timex, "~> 0.19.5"},
     {:earmark, "~> 0.1.17"},
     {:comeonin, "~> 1.0"},
     {:rss, "~> 0.2.1"}
    ]
  end
end
