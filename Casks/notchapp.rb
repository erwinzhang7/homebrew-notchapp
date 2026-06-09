cask "notchapp" do
  version "1.6.6"
  sha256 "4b80a7c59201c29b7eee9fa3ae7bd2e31de3dedbe4e18510a9f5f4f7741f6906"

  url "https://github.com/erwinzhang7/NotchApp/releases/download/v#{version}/NotchApp.zip"
  name "NotchApp"
  desc "Notch utility: clipboard, file shelf, media controls, calendar/reminders, and file conversion"
  homepage "https://github.com/erwinzhang7/NotchApp"

  depends_on macos: :sequoia

  app "NotchApp.app"

  # Self-signed (local "NotchApp Dev" identity), not notarized - clear
  # quarantine so Gatekeeper doesn't block launch with the "unidentified
  # developer" or "damaged app" prompt.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/NotchApp.app"],
                   sudo: false
  end

  uninstall quit: "com.erwinzhang.NotchApp"

  zap trash: [
    "~/Library/Preferences/com.erwinzhang.NotchApp.plist",
  ]
end
