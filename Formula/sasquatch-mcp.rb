# Homebrew formula for sasquatch-mcp.
#
# Source release artifacts: github.com/sasquatchlabsio/sasquatch-mcp
# Customer install:
#
#     brew tap sasquatchlabsio/sasquatch
#     brew install sasquatch-mcp
#
# Per-release maintenance: scripts/release-mcp-tap.sh in the source
# repo bumps `version` + `sha256` and pushes to this tap. Source
# tarball lives on the org's release-only repo so customers running
# `brew info` see only sasquatchlabsio surfaces.

class SasquatchMcp < Formula
  desc "Model Context Protocol server for Sasquatch's compressed log / trace / metric archive"
  homepage "https://sasquatchlabs.io"
  license "MIT"
  version "0.3.31"

  url "https://github.com/sasquatchlabsio/sasquatch-mcp/releases/download/v#{version}/sasquatch-mcp-#{version}.tar.gz"
  sha256 "7e78fef6f9c152d66f4db5bef20fbed8b8900169c62007fa996d9af855d99225"

  depends_on "rust" => :build

  def install
    # Tarball extracts to sasquatch-mcp-<version>/ — Homebrew chdirs
    # in by default, so cargo install runs from the right place.
    system "cargo", "install", *std_cargo_args
  end

  test do
    # Initialize handshake — the tightest possible smoke that doesn't
    # need network access. The binary writes to stdout; the JSON
    # contains "sasquatch-mcp" in serverInfo.name.
    output = pipe_output(
      "#{bin}/sasquatch-mcp --transport stdio --query-url https://example.invalid",
      '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{}}',
      0
    )
    assert_match "sasquatch-mcp", output
  end
end
