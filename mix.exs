defmodule Mphfish.MixProject do
  use Mix.Project

  def project do
    [
      app: :mphfish,
      version: "0.1.0",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [
        plt_file: {:no_warn, "priv/plts/dialyzer.plt"},
        plt_add_deps: :transitive,
        remove_defaults: [:unknown]
      ],
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      source_url: "https://github.com/mphfish/mphfish.com"
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Mphfish.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.5"},
      {:phoenix_pubsub, "~> 2.0"},
      {:phoenix_html, "~> 2.14"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:gettext, "~> 0.11"},
      {:jason, "~> 1.0"},
      {:plug_cowboy, "~> 2.2"},
      {:credo, "~> 1.4"},
      {:dialyxir, "1.0.0", only: [:dev], runtime: false},
      {:mix_test_watch, "~> 1.0.2", only: :dev, runtime: false},
      {:excoveralls, "~> 0.10", only: :test},
      {:recase, "~> 0.6.0"},
      {:earmark, "~> 1.4.3"},
      {:distillery, "~> 2.0"},
      {:junit_formatter, "~> 3.0", only: [:test]}
    ]
  end
end
