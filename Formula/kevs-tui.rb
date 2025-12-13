class KevsTui < Formula
  desc "Terminal UI for browsing CISA Known Exploited Vulnerabilities (KEV)"
  homepage "https://github.com/ethanolivertroy/kevs-tui"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ethanolivertroy/kevs-tui/releases/download/v0.1.0/kevs-tui-darwin-arm64"
      sha256 "dd2199eeba6bab2246eeadd5550d319e602f621c79319b3a6e6003e51315e8ce"
    else
      url "https://github.com/ethanolivertroy/kevs-tui/releases/download/v0.1.0/kevs-tui-darwin-amd64"
      sha256 "91132aeaf32bb8f3a1231580ae23b92a8d8705c949335a1b57807ffcb7e183be"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ethanolivertroy/kevs-tui/releases/download/v0.1.0/kevs-tui-linux-arm64"
      sha256 "81c2ba20d3a26e11369b5ff22b664d769361e0faa7a12bb6839e9b70efa040c4"
    else
      url "https://github.com/ethanolivertroy/kevs-tui/releases/download/v0.1.0/kevs-tui-linux-amd64"
      sha256 "2718d629bc359f1401f9424d47ff18193a8facac5114a114f6df41d74f4f7f42"
    end
  end

  def install
    binary_name = Dir["*"].first
    bin.install binary_name => "kevs-tui"
  end

  test do
    assert_match "KEV", shell_output("#{bin}/kevs-tui --help 2>&1", 1)
  end
end
