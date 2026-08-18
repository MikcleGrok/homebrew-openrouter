class OpenrouterModelTracker < Formula
  desc "Regenerate the OpenRouter model comparison document from live data"
  homepage "https://openrouter.ai/"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.27/openrouter-1.14.27-darwin-arm64.tar.gz"
      sha256 "fae7f0c986c7a14fef31351426229b76ec203d733afe88f1658c722586bd9afd"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.27/openrouter-1.14.27-darwin-amd64.tar.gz"
      sha256 "2beb36b9e4ba4c389c54948652f4ec20117d67ff731576a72e0a7bb8ff7d6a1e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.27/openrouter-1.14.27-linux-arm64.tar.gz"
      sha256 "ba524bfda3ae3ae0b2f842e666839736767d28f3a6f199311ad4e0fe89ab1c6e"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.27/openrouter-1.14.27-linux-amd64.tar.gz"
      sha256 "a13c7af720fa504d6266150778e685995e779aba68cce3dd9168a36fa2d279f2"
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
