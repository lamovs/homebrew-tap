class Tt < Formula
  desc "TickTick CLI and TUI"
  homepage "https://github.com/lamovs/tt"
  version "0.4.0"

  on_macos do
    depends_on macos: :ventura
    on_arm do
      url "https://github.com/lamovs/tt/releases/download/v0.4.0/tt_0.4.0_darwin_arm64.tar.gz"
      sha256 "aa1ea77b0bd3b0f66b10fa240ee27b53b3e3631e87654f35e06fa83ea0084184"
    end
    on_intel do
      url "https://github.com/lamovs/tt/releases/download/v0.4.0/tt_0.4.0_darwin_amd64.tar.gz"
      sha256 "f4fed2403c89ac991a95fe623f2039829643718d8ebdd8c2c93f94434835cc97"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamovs/tt/releases/download/v0.4.0/tt_0.4.0_linux_arm64.tar.gz"
      sha256 "c68c32d90f2938d0a042b2fecd0b09f514431581f0a0da3070fe7644976cc352"
    end
    on_intel do
      url "https://github.com/lamovs/tt/releases/download/v0.4.0/tt_0.4.0_linux_amd64.tar.gz"
      sha256 "b83f59008a67ff9fcbf66cd1f1ff4fe84250879e1e108976ffac40f8d7a1d6eb"
    end
  end

  def install
    bin.install "tt"
    pkgshare.install Dir["share/tt/*"]
    if OS.mac?
      bin.install_symlink pkgshare/"integrations/macos/tt-notify"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tt version")
    assert_match "setup", shell_output("#{bin}/tt help setup")
  end
end
