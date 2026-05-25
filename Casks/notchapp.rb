cask "notchapp" do
  version "1.1.0"
  sha256 "2016c90b59675d8050cc4371fb2212a6bf8324aafda3e29128d2b51fc5cc8dc5"

  url "https://github.com/erwinzhang7/NotchApp/releases/download/v#{version}/NotchApp.zip"
  name "NotchApp"
  desc "Notch utility: clipboard, file shelf, media controls, calendar/reminders, and file conversion"
  homepage "https://github.com/erwinzhang7/NotchApp"

  depends_on macos: ">= :sequoia"

  app "NotchApp.app"

  # Ad-hoc signed, not notarized — clear quarantine so Gatekeeper doesn't
  # block launch with the "unidentified developer" or "damaged app" prompt.
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
