# homebrew-sasquatch

Homebrew tap for [Sasquatch Labs](https://sasquatchlabs.io) tools.

## Install

```bash
brew tap sasquatchlabsio/sasquatch
brew install sasquatch-mcp
```

## Formulas

| Formula | What it does |
|---|---|
| `sasquatch-mcp` | Model Context Protocol server exposing Snowman's compressed log / trace / metric query API to AI agents (Claude Desktop, Cursor, Continue, hosted bots). |

Each formula's source artifacts live on the
[`sasquatchlabsio/sasquatch-mcp`](https://github.com/sasquatchlabsio/sasquatch-mcp/releases)
release page. The Homebrew tap just points at those release tarballs.

## Updating

Per-release: a small script in the development repo computes the new
tarball's SHA-256 and pushes the bumped formula here. No manual
maintenance.
