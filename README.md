# Homebrew tap

Command-line tools by [Pushpinder](https://github.com/swiftlysingh).

## Available formulas

| Formula | Description |
|---------|-------------|
| [excalidraw-cli](https://github.com/swiftlysingh/excalidraw-cli) | Create editable Excalidraw diagrams from DSL, JSON, or DOT and export PNG/SVG images. |

## Install

```bash
brew install swiftlysingh/tap/excalidraw-cli
```

Or add the tap first:

```bash
brew tap swiftlysingh/tap
brew install excalidraw-cli
```

Homebrew installs Node.js as a dependency. The formula uses the published npm
package, which includes the built CLI and its man page.

## Switching from npm

If `brew install` reports that `excalidraw-cli` already exists, a global npm
installation may own the command and man-page links. To switch this package to
Homebrew:

```bash
npm uninstall -g @swiftlysingh/excalidraw-cli
brew link excalidraw-cli
```

Run `brew link` only if Homebrew already installed the formula and stopped at
the linking step. Otherwise, run the install command above after removing the
npm package.

## Use

```bash
excalidraw-cli create --inline '(Start) -> [Process] -> (End)' -o flow.excalidraw
excalidraw-cli convert flow.excalidraw --format png
excalidraw-cli convert flow.excalidraw --format svg
man excalidraw-cli
```

See the [CLI documentation](https://github.com/swiftlysingh/excalidraw-cli#readme)
for more examples. Features marked unreleased there require a source checkout
until the next npm release updates this formula.

## Update

```bash
brew update
brew upgrade swiftlysingh/tap/excalidraw-cli
```

## Verify the installation

```bash
excalidraw-cli --version
brew test swiftlysingh/tap/excalidraw-cli
```

The formula test creates a diagram and exports both SVG and PNG.

## Maintaining the formula

The [CLI release workflow](https://github.com/swiftlysingh/excalidraw-cli/blob/main/.github/workflows/release.yml)
updates `Formula/excalidraw-cli.rb` after publishing to npm. Its
`HOMEBREW_TAP_GITHUB_TOKEN` secret is stored in the **excalidraw-cli** repository
and needs Contents read/write access to this tap.

Before the next CLI release, merge the release-workflow fixes in
[PR #35](https://github.com/swiftlysingh/excalidraw-cli/pull/35) and
[PR #36](https://github.com/swiftlysingh/excalidraw-cli/pull/36) so automated updates
retain the built package, executable links, and export tests.

For a manual formula update, use the exact published npm tarball and its SHA256.
Run `brew install --build-from-source swiftlysingh/tap/excalidraw-cli` and
`brew test swiftlysingh/tap/excalidraw-cli` before pushing. If already installed,
use `brew reinstall --build-from-source swiftlysingh/tap/excalidraw-cli` instead.
