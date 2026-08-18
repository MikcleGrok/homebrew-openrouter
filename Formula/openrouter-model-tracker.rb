class OpenrouterModelTracker < Formula
  desc "Regenerate the OpenRouter model comparison document from live data"
  homepage "https://openrouter.ai/"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.25/openrouter-1.14.25-darwin-arm64.tar.gz"
      sha256 "e2348c2ad508cba9fb3cfec6d95bf832bdd843f59e595d83beac74c717c980dc"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.25/openrouter-1.14.25-darwin-amd64.tar.gz"
      sha256 "910ba1badf72f6f9ab017a5264f75d7bca3539df775bf8934f7052b6b0d520f6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.25/openrouter-1.14.25-linux-arm64.tar.gz"
      sha256 "4def6c6f6f7714094166a56b2833b8484a47c8998331770590f3990dacd8adb5"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.25/openrouter-1.14.25-linux-amd64.tar.gz"
      sha256 "38739f12e23ca4741f3fbabc4326df5735521011a7a78ef6dd1a71f0cebfd2ce"
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
