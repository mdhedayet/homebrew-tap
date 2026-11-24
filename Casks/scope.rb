cask "scope" do
  arch arm: "arm64", intel: "x64"

  version "0.1.23"
  sha256 arm:   "30f24da8a82eaf0f22dd4e2f4feb87b46a21451bee2f419e11c7b8787acd44b1",
         intel: "2cf14b817ac264fc5f11aae5845f7a7284a5b51f8388108b733da0b54efe2487"

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
