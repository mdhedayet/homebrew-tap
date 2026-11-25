cask "scope" do
  arch arm: "arm64", intel: "x64"

  version "0.1.24"
  sha256 arm:   "82cf37463fe986420107ea294c4137b702cb07782f496f1cc18b532786b3dc1c",
         intel: "94ac867efb3b3bc99253a2f69dc9f1b2ce8c12bd2920dd33f8cb1f94653f71f5"

  url "https://github.com/mdhedayet/scope-releases/releases/download/v#{version}/Scope-#{version}-#{arch}.dmg"
  name "Scope"
  desc "AI-native code editor with a built-in coding agent"
  homepage "https://scopeide.com"

  app "Scope.app"

  # Not notarized by Apple yet, so clear the download quarantine flag to avoid the Gatekeeper "Not Opened" dialog
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Scope.app"]
  end

  zap trash: [
    "~/Library/Application Support/Scope",
    "~/Library/Preferences/com.scopeide.desktop.plist",
  ]
end
