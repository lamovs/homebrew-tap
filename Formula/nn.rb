class Nn < Formula
  desc "Fast capture and search CLI for a Markdown vault"
  homepage "https://github.com/lamovs/nn"
  version "0.1.0"

  on_macos do
    depends_on macos: :ventura
    on_arm do
      url "https://github.com/lamovs/nn/releases/download/v0.1.0/nn_0.1.0_darwin_arm64.tar.gz"
      sha256 "4778f054a53f1b231d32c567d776d6bfc9a3bed00513a3802a3605b4a588d879"
    end
    on_intel do
      url "https://github.com/lamovs/nn/releases/download/v0.1.0/nn_0.1.0_darwin_amd64.tar.gz"
      sha256 "b1543d4e752d03c7b46f22b77a64ac3c3725b6df8df187eb80f05a4aadd01421"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamovs/nn/releases/download/v0.1.0/nn_0.1.0_linux_arm64.tar.gz"
      sha256 "18161f715ae7133138434f04d49495b5e5d8620867a8bfd3f7075525b7a7738e"
    end
    on_intel do
      url "https://github.com/lamovs/nn/releases/download/v0.1.0/nn_0.1.0_linux_amd64.tar.gz"
      sha256 "535cda34b99be736f98d593afd5c9519f4c9cd14131dd38de843a5145657b355"
    end
  end

  def install
    bin.install "nn"
    pkgshare.install Dir["share/nn/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nn version")
    assert_match "setup", shell_output("#{bin}/nn help setup")
  end
end
