cask "notchapp" do
  version "1.5.1"
  sha256 "83b0709957b7d16bdd0ae583a1f32410fce38f397353c299ae51c2db581b8efa"

  url "https://github.com/erwinzhang7/NotchApp/releases/download/v#{version}/NotchApp.zip"
  name "NotchApp"
  desc "Notch utility: clipboard, file shelf, media controls, calendar/reminders, and file conversion"
  homepage "https://github.com/erwinzhang7/NotchApp"

  depends_on macos: ">= :sequoia"

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
