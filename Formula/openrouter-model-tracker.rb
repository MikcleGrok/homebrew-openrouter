class OpenrouterModelTracker < Formula
  desc "Regenerate the OpenRouter model comparison document from live data"
  homepage "https://openrouter.ai/"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.23/openrouter-1.14.23-darwin-arm64.tar.gz"
      sha256 "40e73b877b73fcb159b4f905722f6bed1994412eac3ab1a134c7801d6fb137b3"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.23/openrouter-1.14.23-darwin-amd64.tar.gz"
      sha256 "e7cc5ecd23c979f5ef8680343aafcec42e597c276badf6e4fde9e7010bfc3e53"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.23/openrouter-1.14.23-linux-arm64.tar.gz"
      sha256 "12778c1f344b7f08421a8b7e873eea713d744278f26f8f2631fd257e43c4312e"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.23/openrouter-1.14.23-linux-amd64.tar.gz"
      sha256 "7889e0cbf6ce01c5923a628c3ddf1ccbf06e6adee2a2cfe4a7cfac4f69ad691e"
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
