class Wut < Formula
  desc "Tiny, fast terminal assistant powered by Cerebras"
  homepage "https://github.com/ethanolivertroy/wut"
  version "0.0.2"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/ethanolivertroy/wut/releases/download/v0.0.2/wut-aarch64-apple-darwin.tar.gz"
      sha256 "a48dde3495230ebed1d85e081d37db4fd9d47f014e6a6e58554e3806dddda21e"
    end
    on_intel do
      url "https://github.com/ethanolivertroy/wut/releases/download/v0.0.2/wut-x86_64-apple-darwin.tar.gz"
      sha256 "f6c93ca846fbc73d9a7ba77ec19a15bcd770c73222f20c899a8939cfd834012b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ethanolivertroy/wut/releases/download/v0.0.2/wut-aarch64-unknown-linux-musl.tar.gz"
      sha256 "273b76fc3faa2ca6f305be0b22560baf33dc8e830410133ab0bba7e4b3f21b88"
    end
    on_intel do
      url "https://github.com/ethanolivertroy/wut/releases/download/v0.0.2/wut-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7856c11884cc518df242abd10996b74acbca7aa7851d10f9be610abb93b8aa78"
    end
  end

  def install
    bin.install "wut"
    pkgshare.install "README.md", "LICENSE"
  end

  def caveats
    <<~EOS
      wut needs a Cerebras API key. Export it:
        export CEREBRAS_API_KEY=...

      Or save it once, the way the official installer does:
        mkdir -p ~/.config/wut && chmod 700 ~/.config/wut
        printf '%s\\n' YOUR_KEY > ~/.config/wut/credentials
        chmod 600 ~/.config/wut/credentials

      Optional web search: export EXA_API_KEY=...

      For zsh, the official installer also adds punctuation support:
        alias wut='noglob command wut'
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wut --version")
  end
end
