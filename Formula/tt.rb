class Tt < Formula
  desc "TickTick CLI and TUI"
  homepage "https://github.com/lamovs/tt"
  version "0.2.0"

  on_macos do
    depends_on macos: :ventura
    on_arm do
      url "https://github.com/lamovs/tt/releases/download/v0.2.0/tt_0.2.0_darwin_arm64.tar.gz"
      sha256 "0222f4a92b3a1220b2dec89bd50c9abf25b006f25638bfd5faaed2862f8bd716"
    end
    on_intel do
      url "https://github.com/lamovs/tt/releases/download/v0.2.0/tt_0.2.0_darwin_amd64.tar.gz"
      sha256 "ba1c9d7d1dc23c6d7f680f4366ae511a1202f3047243642e8c5f3930e1229859"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamovs/tt/releases/download/v0.2.0/tt_0.2.0_linux_arm64.tar.gz"
      sha256 "99552a6a5909960fa9a4c572f1fc4cc23e7c82d34c35ed89de1192944ac0b5d6"
    end
    on_intel do
      url "https://github.com/lamovs/tt/releases/download/v0.2.0/tt_0.2.0_linux_amd64.tar.gz"
      sha256 "0ac987589c434b535052ee11331ac5c5217e3b6d593a47c25c8af9f856f24dd3"
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
