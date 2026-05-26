cask "notchapp" do
  version "1.1.1"
  sha256 "360c1372f68e332b0935177ff714d373dc2f35f41b3a3c5e0a4320556474eefe"

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
