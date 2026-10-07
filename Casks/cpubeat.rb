cask "cpubeat" do
  version "1.0.0"
  sha256 "6dd1d49fd2132f9bb48d1b5d8a72f9cf1555b3a7b6ae615508837bda3863ab3c"

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
