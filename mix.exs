defmodule NervesSystemBbb.Mixfile do
  use Mix.Project

  @version Path.join(__DIR__, "VERSION")
    |> File.read!
    |> String.strip

  def project do
    [app: :nerves_system_bbb,
     version: @version,
     elixir: "~> 1.2",
     compilers: Mix.compilers ++ [:nerves_system],
     description: description,
     package: package,
     deps: deps]
  end

  def application do
    []
  end

  defp deps do
    [{:nerves_system, path: "../nerves_system"},
     {:nerves_system_br, github: "nerves-project/nerves_system_br", ref: "3759c4af12d4ce67d4ec60851d842d64f41e9f60"},
     #{:nerves_system_br, "~> 0.6.0"},
     {:nerves_toolchain_arm_unknown_linux_gnueabihf, "~> 0.6.0"}]
  end

  defp description do
    """
    Nerves System - BeagleBone Black
    """
  end

  defp package do
    [maintainers: ["Frank Hunleth", "Justin Schneck"],
     files: ["rootfs-additions", "bbb-busybox.config", "LICENSE", "mix.exs", "nerves_defconfig", "nerves.exs", "README.md", "VERSION"],
     licenses: ["Apache 2.0"],
     links: %{"Github" => "https://github.com/nerves-project/nerves_system_bbb"}]
  end
end
