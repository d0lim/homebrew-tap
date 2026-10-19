# homebrew-tap

Homebrew casks for [d0lim](https://github.com/d0lim)'s tools.

```sh
brew install --cask d0lim/tap/<cask>
```

| Cask | What it is | Requires |
| --- | --- | --- |
| [`aaswap`](https://github.com/d0lim/aaswap) | Manages several agent CLI logins on one machine | macOS, or Linux with Homebrew 4.5.0+ |
| [`cockpit`](https://github.com/d0lim/cockpit) | Runs end-to-end flows against a compose stack | macOS or Linux, Docker |
| [`display-remember`](https://github.com/d0lim/display-remember) | Remembers monitors and restores their layouts after reconnect or wake | Apple Silicon, macOS 13+ |
| [`garakuta`](https://github.com/d0lim/garakuta) | Menu bar organizer, notch panel and window switcher | macOS 15+ |
| [`organ`](https://github.com/d0lim/organ) | Personal knowledge and to-do app (alpha) | Apple Silicon, macOS 27+ |

Upgrade with `brew update && brew upgrade --cask <cask>`. Usage and release notes live in each tool's repository.

## Renamed casks

`ccswap` became `aaswap`. The old cask is deprecated and gets no new releases.

```sh
brew uninstall --cask ccswap
brew install --cask d0lim/tap/aaswap
aaswap account adopt
```

## Maintenance

Each cask is written by its tool's release process. Edit the source, not the cask.

| Cask | Written by |
| --- | --- |
| `aaswap` | GoReleaser in the aaswap release |
| `cockpit` | `.github/workflows/cockpit.yaml` here, from the latest cockpit release |
| `display-remember` | `scripts/update-cask.sh` in display-remember |
| `garakuta` | `scripts/update-cask.sh` in garakuta |
| `organ` | copied from the output of `scripts/package-mac.sh` in organ; archives are attached to this repository's `organ-v<version>` releases |
