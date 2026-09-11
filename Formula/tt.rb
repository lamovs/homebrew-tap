class Tt < Formula
  desc "TickTick CLI and TUI"
  homepage "https://github.com/lamovs/tt"
  version "0.1.0"

  on_macos do
    depends_on macos: :ventura
    on_arm do
      url "https://github.com/lamovs/tt/releases/download/v0.1.0/tt_0.1.0_darwin_arm64.tar.gz"
      sha256 "2f7e8cd437e15237bfb9e8a8acfc74d217db07c36f1afb5d144dee556a63aa4d"
    end
    on_intel do
      url "https://github.com/lamovs/tt/releases/download/v0.1.0/tt_0.1.0_darwin_amd64.tar.gz"
      sha256 "ae6f54c79e3c775b26363506cd582c7e27614b69a0ace2fa28deeca702552638"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamovs/tt/releases/download/v0.1.0/tt_0.1.0_linux_arm64.tar.gz"
      sha256 "90b75b8a38b6c4de0a2f2459d52ba886257cc80622df142c3dc10052cd1a9565"
    end
    on_intel do
      url "https://github.com/lamovs/tt/releases/download/v0.1.0/tt_0.1.0_linux_amd64.tar.gz"
      sha256 "c6d9259d8ae5f9e1dd9e20d22977a4bbd4bc7d07cf75feb1cf228d65fcf68b66"
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
