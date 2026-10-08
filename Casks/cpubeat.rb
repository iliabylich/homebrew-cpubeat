cask "cpubeat" do
  version "1.0.1"
  sha256 "530c911c42b8738c78a8c00a58adae30aec0f694d1d465b59bb89f0d0629fea1"

  url "https://github.com/iliabylich/cpubeat/releases/download/v#{version}/cpubeat_#{version}_arm64.dmg"
  name "cpubeat"
  desc "A simple CPU monitoring widget"
  homepage "https://github.com/iliabylich/cpubeat"

  depends_on macos: :tahoe
  depends_on arch: :arm64

  app "cpubeat.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/cpubeat.app"]
  end

  uninstall quit: "cpubeat.app"
end
