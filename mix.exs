defmodule CanDialyzer.MixProject do
  use Mix.Project

  def project do
    [
      app: :can_dialyzer,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [
        flags: [
          :unmatched_returns,
          :error_handling,
          :extra_return,
          :missing_return,
          :underspecs,
          # Temporarily disabled while we wait for
          # https://github.com/jeremyjh/dialyxir/issues/561 and
          # https://github.com/elixir-lang/elixir/issues/14576 to be
          # fixed.
          :no_opaque
        ],
        plt_add_apps: [:mix]
      ],
      consolidate_protocols: Mix.env() != :dev
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:sourceror, "~> 1.8", only: [:dev, :test]},
      {:ash, "~> 3.0"},
      {:igniter, "~> 0.6", only: [:dev, :test]},
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:dialyxir, "~> 1.4.3", only: :dev, runtime: false}
    ]
  end
end
