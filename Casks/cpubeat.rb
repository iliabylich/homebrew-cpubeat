cask "cpubeat" do
  version "1.0.2"
  sha256 "a7629ab75678067507a0b8bea45146014e2d341de4e7540509ca61d0f0f4f937"

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
