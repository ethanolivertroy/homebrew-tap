# Homebrew Tap

Personal Homebrew tap for CLI tools.

## Available Tools

### wut

A tiny, fast terminal assistant powered by Cerebras.

```bash
brew install ethanolivertroy/tap/wut
```

The formula installs the prebuilt release binary (macOS and Linux, Intel and
ARM), so no Rust toolchain is needed. `brew livecheck wut` reports the latest
upstream release.

## Security Tools

Security and compliance tools have moved to a dedicated tap:

```bash
brew tap ethanolivertroy/sectools
```

See [homebrew-sectools](https://github.com/ethanolivertroy/homebrew-sectools) for available tools.

## Maintenance

Bump a formula by hand:

```bash
scripts/bump.sh 0.0.3
```

That downloads the release tarballs, verifies their published SHA-256
checksums, and rewrites `Formula/wut.rb`. The `Bump wut` workflow runs the same
script weekly and commits the result.
