cask "scope" do
  arch arm: "arm64", intel: "x64"

  version "0.1.25"
  sha256 arm:   "4d0cb445111cc21b89dfadff81b61442d0384c7c925dc6ad309edf12882fc09a",
         intel: "1d69b51ac5118bc2b078c5ffc46e5f25119bb010d7b63ee247d1ab0f7425124e"

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
