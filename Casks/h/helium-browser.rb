cask "helium-browser" do
  arch arm: "arm64", intel: "x86_64"

  version "0.2.7.1"
  sha256 arm: "33b224955ae5c7a815952f66866aec958855823dcbc77f88c37540e26c45e657",
         intel: "b27cc3bd58c4545bd8b8decf0aac602c31d4df401e9ab32cb513ca5d15ef8b54"

  url "https://github.com/imputnet/helium-macos/releases/download/#{version}-138.0.7204.100/helium_#{version}_#{arch}-macos.dmg"
  name "Helium"
  desc "Bullshit-free web browser based on Chromium"
  homepage "https://github.com/imputnet/helium-chromium"

  app "Helium.app"
end