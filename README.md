# scoop-hj

[Scoop](https://scoop.sh) bucket for the **hj fork of Git Extensions**
([5solas/gitextensions](https://github.com/5solas/gitextensions)): an in-process
Ghostty console tab and faster repository opening.

## Install

```powershell
scoop bucket add hj https://github.com/5solas/scoop-hj
scoop install extras/windowsdesktop-runtime   # .NET 10 Desktop Runtime, if not installed yet
scoop install hj/gitextensions-hj
```

Start it from the Start menu shortcut **Git Extensions (hj)** or run `gite-hj`.

Update and remove the usual Scoop way:

```powershell
scoop update gitextensions-hj
scoop uninstall gitextensions-hj
```

## Notes

- The app is installed as `gitextensions-hj`, so it can sit next to the upstream
  `extras/gitextensions` package. The shim is named `gite-hj` to avoid a clash with
  upstream's `gite` and `GitExtensions` commands.
- The package uses the portable zip from the fork's GitHub releases. Its
  `GitExtensions.settings` file is kept in Scoop's `persist` folder, so settings survive
  updates. The shell extension (Explorer context menu) and the SSH passphrase prompt are
  only in the MSI on the release page.
- The builds are not code-signed, so Windows SmartScreen may warn on first run.

## How updates reach this bucket

The `Excavator` workflow runs every six hours. It uses Scoop's own `checkver`
with the manifest's `checkver`/`autoupdate` rules to find the latest
`hj/v<version>-hj-<n>` release, downloads the portable zip, writes the new version,
URL and SHA-256 into the manifest, and commits the change.

To check by hand: `.\bin\checkver.ps1` (add `gitextensions-hj -u` to update the manifest).
