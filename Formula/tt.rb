class Tt < Formula
  desc "TickTick CLI and TUI"
  homepage "https://github.com/lamovs/tt"
  version "0.3.2"

  on_macos do
    depends_on macos: :ventura
    on_arm do
      url "https://github.com/lamovs/tt/releases/download/v0.3.2/tt_0.3.2_darwin_arm64.tar.gz"
      sha256 "a0e083a53b2ad284fc4348ec968232da4f3d1f74857dd11f0d40fa6aa5dd6a66"
    end
    on_intel do
      url "https://github.com/lamovs/tt/releases/download/v0.3.2/tt_0.3.2_darwin_amd64.tar.gz"
      sha256 "0c7fd19fa0a5ec147645c0402c96852194e445ab2f4b3a9accfac491de66d2ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamovs/tt/releases/download/v0.3.2/tt_0.3.2_linux_arm64.tar.gz"
      sha256 "c3f83d01d45fb40be2de7cc300918ffbf5a258d39f5f4aa8f67520b0cf2de113"
    end
    on_intel do
      url "https://github.com/lamovs/tt/releases/download/v0.3.2/tt_0.3.2_linux_amd64.tar.gz"
      sha256 "ce7cc7a7524beec869a5bbd2014d7cbecae702104dde6ae53a2415479cae277a"
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
