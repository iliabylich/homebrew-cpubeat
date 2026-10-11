cask "cpubeat" do
  version "1.0.4"
  sha256 "58c239051d5897b6f3b78600fdf9ff2ada133e15876630331bbe4915a59f5d31"

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
