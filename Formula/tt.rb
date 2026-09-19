class Tt < Formula
  desc "TickTick CLI and TUI"
  homepage "https://github.com/lamovs/tt"
  version "0.3.0"

  on_macos do
    depends_on macos: :ventura
    on_arm do
      url "https://github.com/lamovs/tt/releases/download/v0.3.0/tt_0.3.0_darwin_arm64.tar.gz"
      sha256 "87feabd214763028584f672ccdc2292795aef92ee2faf94a9a99ecc962e80c9a"
    end
    on_intel do
      url "https://github.com/lamovs/tt/releases/download/v0.3.0/tt_0.3.0_darwin_amd64.tar.gz"
      sha256 "cbfe42f503e2b62e16e39195eed1268d30947fca4557597158f459153d19a9de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamovs/tt/releases/download/v0.3.0/tt_0.3.0_linux_arm64.tar.gz"
      sha256 "3e86fb7c8ae70b1ef4d3e380ad1aba71906bac8846833c3795443bd6e3efffc7"
    end
    on_intel do
      url "https://github.com/lamovs/tt/releases/download/v0.3.0/tt_0.3.0_linux_amd64.tar.gz"
      sha256 "8c4a71c641b6210f2de62bc6ab4f70e4c5e842b7d5699f8fa36f2e9f9aaf41dc"
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
