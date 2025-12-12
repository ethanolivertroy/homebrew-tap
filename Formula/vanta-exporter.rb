class VantaExporter < Formula
  desc "CLI tool to export Vanta audit evidence organized by control"
  homepage "https://github.com/ethanolivertroy/vanta-go-export"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ethanolivertroy/vanta-go-export/releases/download/v0.1.0/vanta-exporter-darwin-arm64"
      sha256 "4cc2f193b5f0801e8d226e61f39a69f9ef6f7b51b92a5bee5ff32ac1b4ffa1db"
    else
      url "https://github.com/ethanolivertroy/vanta-go-export/releases/download/v0.1.0/vanta-exporter-darwin-amd64"
      sha256 "be7735abd012d8806697c1745949b1ad521078e7f5e70fd5d4db8d2e5ec1404e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ethanolivertroy/vanta-go-export/releases/download/v0.1.0/vanta-exporter-linux-arm64"
      sha256 "f4f92a7075c57fb935eb0a5de6b039650426963c76b6ef07dc440591fc28d4e6"
    else
      url "https://github.com/ethanolivertroy/vanta-go-export/releases/download/v0.1.0/vanta-exporter-linux-amd64"
      sha256 "e2d5a6902de71877c6c05ca623a8d48ac9e461ea8be9fec587af446af7bba918"
    end
  end

  def install
    binary_name = Dir["*"].first
    bin.install binary_name => "vanta-exporter"
  end

  test do
    assert_match "vanta", shell_output("#{bin}/vanta-exporter --help 2>&1", 2)
  end
end
