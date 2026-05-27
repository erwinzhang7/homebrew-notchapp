# homebrew-notchapp

Homebrew tap for [NotchApp](https://github.com/erwinzhang7/NotchApp) — a notch utility for macOS with clipboard history, file shelf, ambient dashboard (calendar / reminders / now-playing), media controls, lyrics, a lock-screen music widget, and a Dynamic Island–style activity pill.

## Install

```sh
brew install --cask erwinzhang7/notchapp/notchapp
```

One command. Auto-taps and installs the cask. NotchApp launches as a background utility (no Dock icon); the notch surface appears immediately.

## Update

```sh
brew upgrade --cask notchapp
```

## Uninstall

```sh
brew uninstall --cask notchapp          # removes the app
brew uninstall --cask --zap notchapp    # also clears NotchApp's preferences
```

## Requirements

- **macOS Sequoia (15) or newer.** NotchApp targets `macOS 15.0+`; some features (the lock-screen widget, the always-on idle pill) rely on APIs that don't exist in earlier releases.
- A MacBook with a notch is recommended but not required — the activity pill falls back to a sensible non-notched position.

## Code signing

NotchApp ships **self-signed (`NotchApp Dev`) and not notarized**. The signing identity is a self-signed certificate in the maintainer's keychain rather than an Apple Developer ID, which means Gatekeeper on your machine doesn't know the issuer and will block first launch unless quarantine is cleared.

The cask handles this automatically: its postflight runs `xattr -dr com.apple.quarantine` on the installed app, which tells Gatekeeper not to enforce the unknown-issuer check. After `brew install`, you should be able to launch NotchApp directly with no extra steps.

### If macOS still blocks the app

If you see **"NotchApp is damaged and can't be opened"** or **"NotchApp can't be opened because Apple cannot check it for malicious software"** after installing:

1. **Re-run the quarantine clear manually**:
   ```sh
   xattr -cr /Applications/NotchApp.app
   ```
   Then launch the app again.

2. **Or allow in System Settings**: open System Settings → Privacy & Security → scroll to the security section → click **Open Anyway** next to the NotchApp entry. macOS 15+ relabeled this; it can also appear as "Allow this application to run".

3. **As a last resort** (if neither of the above clears it), tell Gatekeeper to accept the app by signature:
   ```sh
   sudo spctl --add /Applications/NotchApp.app
   ```

### Why self-signed?

Apple Developer ID + notarization costs $99/year. Self-signing is free and works on every Mac, but Gatekeeper warns on first launch because the issuer isn't in Apple's notary database. The signature itself is real and stable — the app verifies cleanly under `codesign --verify`, and macOS's Accessibility / privacy grants anchor to the signing identity normally (grants persist across updates as long as the cert chain matches).

### Accessibility permission

A few features (auto-copy on text selection, hardware brightness/volume key interception) require an Accessibility grant. NotchApp will prompt the first time one of those features needs it; grant once in System Settings → Privacy & Security → Accessibility and it persists across updates.

## License and source lineage

NotchApp is distributed under the [GNU General Public License v3.0](https://github.com/erwinzhang7/NotchApp/blob/main/LICENSE). It includes adapted GPL-3.0 work from [DynamicNotch](https://github.com/jackson-storm/DynamicNotch) and presentation patterns from [Atoll](https://github.com/Ebullioscopic/Atoll); the application repository records the full attribution and bundled-component terms in its [NOTICE](https://github.com/erwinzhang7/NotchApp/blob/main/NOTICE).

This tap distributes cask metadata for the application; the cask links to the application license through its `license` stanza.

## Issues and source

Source code, release notes, and issue tracker live at [erwinzhang7/NotchApp](https://github.com/erwinzhang7/NotchApp).

This tap repo only hosts the Homebrew cask formula. PRs for cask metadata (description, dependencies, postflight changes) are welcome here; everything else goes on the main repo.
