# Homebrew formula template. packaging/render.sh fills in 1.0.4 and the @SHA_*@
# checksums and the release workflow pushes the result to charitraa/homebrew-neplang.
class Neplang < Formula
  desc "Programming language with romanized Nepali keywords"
  homepage "https://github.com/charitraa/NepLang"
  version "1.0.4"
  license "MIT"

  on_macos do
    url "https://github.com/charitraa/NepLang/releases/download/v1.0.4/neplang-macos-universal"
    sha256 "82e97b2bdcbc1b83f27cb3830a3c269590ca367e5457a79f93ffd830c7cca7ac"
  end

  on_linux do
    on_intel do
      url "https://github.com/charitraa/NepLang/releases/download/v1.0.4/neplang-linux-x86_64"
      sha256 "e7a8831c8b306cf47fa3ad927e1b76b39f7afa9c4bea7fa44a703d651a7a46a7"
    end
    on_arm do
      url "https://github.com/charitraa/NepLang/releases/download/v1.0.4/neplang-linux-arm64"
      sha256 "dc3984e3c2548a80a7ec9af24d49e2da8b64fa1d261de7d043c0641554e92503"
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
