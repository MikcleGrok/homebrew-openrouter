class OpenrouterModelTracker < Formula
  desc "Regenerate the OpenRouter model comparison document from live data"
  homepage "https://openrouter.ai/"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.30/openrouter-1.14.30-darwin-arm64.tar.gz"
      sha256 "b5df95e3ba2448655ee0e7fa005fe511d5fe253aad6aff426819c4d785378e45"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.30/openrouter-1.14.30-darwin-amd64.tar.gz"
      sha256 "2db2d0e224190a52d2dd8f8586f85fc5e1e5e77ae570474609eea14ff032b020"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.30/openrouter-1.14.30-linux-arm64.tar.gz"
      sha256 "e38e26336a40f0f84732de6323f80a6abda6c1f0dd2a2ee38017d5db36995565"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.30/openrouter-1.14.30-linux-amd64.tar.gz"
      sha256 "b63dffa525b3bcfafc7e94f469d9ace4b1738c9c8319e2fd67fde96a3c5a0605"
    end
  end

  def install
    bin.install Dir["openrouter-*"].first => "openrouter-model-tracker"
    bin.install_symlink "openrouter-model-tracker" => "omt"
  end

  test do
    assert_equal "openrouter #{version}\n", shell_output("#{bin}/openrouter-model-tracker version")
    assert_equal "openrouter version #{version}\n", shell_output("#{bin}/openrouter-model-tracker --version")
    system bin/"openrouter-model-tracker", "--help"
    assert_predicate bin/"omt", :symlink?
    assert_equal "openrouter version #{version}\n", shell_output("#{bin}/omt --version")
  end
end
