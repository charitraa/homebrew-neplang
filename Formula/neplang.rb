# Homebrew formula template. packaging/render.sh fills in 1.0.3 and the @SHA_*@
# checksums and the release workflow pushes the result to charitraa/homebrew-neplang.
class Neplang < Formula
  desc "Programming language with romanized Nepali keywords"
  homepage "https://github.com/charitraa/NepLang"
  version "1.0.3"
  license "MIT"

  on_macos do
    url "https://github.com/charitraa/NepLang/releases/download/v1.0.3/neplang-macos-universal"
    sha256 "b2cbafc57fc8c0d416603bd2b90a779a9182a9df1adcabe190fc67685ca3ee47"
  end

  on_linux do
    on_intel do
      url "https://github.com/charitraa/NepLang/releases/download/v1.0.3/neplang-linux-x86_64"
      sha256 "836c970989c681757cfedcab1a019c4d416282969b902e3800056852d2665fbc"
    end
    on_arm do
      url "https://github.com/charitraa/NepLang/releases/download/v1.0.3/neplang-linux-arm64"
      sha256 "d85b47ce2cb1fadfca660cee065377408b1ac6407f5bc779e989a0067cce793b"
    end
  end

  def install
    bin.install Dir["neplang-*"].first => "neplang"
  end

  test do
    (testpath/"test.np").write("vana(2 + 3)\n")
    assert_equal "5", shell_output("#{bin}/neplang #{testpath}/test.np").strip
  end
end
