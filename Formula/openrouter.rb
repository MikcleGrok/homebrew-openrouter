class Openrouter < Formula
  desc "Regenerate the OpenRouter model comparison document from live data"
  homepage "https://openrouter.ai/"
  version "1.14.20"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.20/openrouter-1.14.20-darwin-arm64.tar.gz"
      sha256 "0cf738b961a7ba71516f4a55c1aa5dfe11a89c7efcaee2705017bdf97f2b88b0"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.20/openrouter-1.14.20-darwin-amd64.tar.gz"
      sha256 "6976b92685771958adf4754702e2807a66d1b19dd088dd69f0b5d53e3fab205d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.20/openrouter-1.14.20-linux-arm64.tar.gz"
      sha256 "3c7994edf4696775f3ac92505db3eb06a9c93685993c2a8be8d92ccf2bfd183e"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.20/openrouter-1.14.20-linux-amd64.tar.gz"
      sha256 "fc593b8b121d26410bade63d09c559fc263e7604f14a6e7837878eb96efc8034"
    end
  end

  def install
    bin.install Dir["openrouter-*"].first => "openrouter"
  end

  test do
    assert_equal "openrouter #{version}\n", shell_output("#{bin}/openrouter version")
    assert_equal "openrouter version #{version}\n", shell_output("#{bin}/openrouter --version")
    system bin/"openrouter", "--help"
  end
end
