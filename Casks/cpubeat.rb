cask "cpubeat" do
  version "1.0.3"
  sha256 "0da032744b0566e9fbef6c7416579dc0dc0b6272f28b6012c7cd1bd293bc5ddb"

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
