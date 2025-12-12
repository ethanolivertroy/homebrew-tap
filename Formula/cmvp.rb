class Cmvp < Formula
  desc "Terminal UI for searching NIST CMVP validated cryptographic modules"
  homepage "https://github.com/ethanolivertroy/NIST-CMVP-CLI"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ethanolivertroy/NIST-CMVP-CLI/releases/download/v0.1.0/cmvp-darwin-arm64"
      sha256 "9b0590491a7465ba54d5d88e917ee74bef358583a170d21e2985c77e71a3220b"
    else
      url "https://github.com/ethanolivertroy/NIST-CMVP-CLI/releases/download/v0.1.0/cmvp-darwin-amd64"
      sha256 "0e2cc69ef1f04c6955d37bce51047a8d7a74ae8a04fcea69c3250977df5eeb7c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/ethanolivertroy/NIST-CMVP-CLI/releases/download/v0.1.0/cmvp-linux-arm64"
      sha256 "2df76c58e6f70b5d4a82595f630cc5401dd24918077d262850b95649f0fdc556"
    else
      url "https://github.com/ethanolivertroy/NIST-CMVP-CLI/releases/download/v0.1.0/cmvp-linux-amd64"
      sha256 "1093330e669be56e95f281e0203b0db8f440bb896d1eab6db9db4a3b72baf472"
    end
  end

  def install
    binary_name = Dir["*"].first
    bin.install binary_name => "cmvp"
  end

  test do
    assert_match "CMVP", shell_output("#{bin}/cmvp --help 2>&1", 1)
  end
end
