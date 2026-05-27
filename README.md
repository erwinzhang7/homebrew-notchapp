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

NotchApp ships **ad-hoc signed and not notarized**. The cask runs `xattr -dr com.apple.quarantine` on the app post-install so Gatekeeper doesn't show the "unidentified developer" / "damaged app" prompt on first launch. If you'd rather verify and clear the flag yourself, install via:

```sh
brew install --cask --no-quarantine erwinzhang7/notchapp/notchapp
```

## License and source lineage

NotchApp is distributed under the [GNU General Public License v3.0](https://github.com/erwinzhang7/NotchApp/blob/main/LICENSE). It includes adapted GPL-3.0 work from [DynamicNotch](https://github.com/jackson-storm/DynamicNotch) and presentation patterns from [Atoll](https://github.com/Ebullioscopic/Atoll); the application repository records the full attribution and bundled-component terms in its [NOTICE](https://github.com/erwinzhang7/NotchApp/blob/main/NOTICE).

This tap distributes cask metadata for the application; the cask links to the application license through its `license` stanza.

## Issues and source

Source code, release notes, and issue tracker live at [erwinzhang7/NotchApp](https://github.com/erwinzhang7/NotchApp).

This tap repo only hosts the Homebrew cask formula. PRs for cask metadata (description, dependencies, postflight changes) are welcome here; everything else goes on the main repo.
