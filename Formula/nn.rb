class Nn < Formula
  desc "Fast capture and search CLI for a Markdown vault"
  homepage "https://github.com/lamovs/nn"
  version "0.2.0"

  on_macos do
    depends_on macos: :ventura
    on_arm do
      url "https://github.com/lamovs/nn/releases/download/v0.2.0/nn_0.2.0_darwin_arm64.tar.gz"
      sha256 "ccc0b938c2b84136918b4f3bc6ac59a89db61a6194d2150228f525db81c08e0a"
    end
    on_intel do
      url "https://github.com/lamovs/nn/releases/download/v0.2.0/nn_0.2.0_darwin_amd64.tar.gz"
      sha256 "08ac48ce11b48cb8b8160c0afe9c344955bb00ad794c3b7a6920d27f83d0edec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/lamovs/nn/releases/download/v0.2.0/nn_0.2.0_linux_arm64.tar.gz"
      sha256 "c26f88d21686e2ef039cc63b0e0f76e7789cd999e57737bc8096233b9d059e99"
    end
    on_intel do
      url "https://github.com/lamovs/nn/releases/download/v0.2.0/nn_0.2.0_linux_amd64.tar.gz"
      sha256 "1a1741d00874a55246e8ac6a3f353672604561896b7f8496a11ab797ba926e5d"
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
