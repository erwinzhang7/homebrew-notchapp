cask "notchapp" do
  version "1.4.0"
  sha256 "62aebbbac77009d48358d95f4562aebcf561d3304c55e464a57cf11f7987e2ce"

  url "https://github.com/erwinzhang7/NotchApp/releases/download/v#{version}/NotchApp.zip"
  name "NotchApp"
  desc "Notch utility: clipboard, file shelf, media controls, calendar/reminders, and file conversion"
  homepage "https://github.com/erwinzhang7/NotchApp"
  license "https://github.com/erwinzhang7/NotchApp/blob/main/LICENSE"

  depends_on macos: ">= :sequoia"

  app "NotchApp.app"

  # Ad-hoc signed, not notarized - clear quarantine so Gatekeeper doesn't
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
