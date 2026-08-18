class OpenrouterModelTracker < Formula
  desc "Regenerate the OpenRouter model comparison document from live data"
  homepage "https://openrouter.ai/"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.31/openrouter-1.14.31-darwin-arm64.tar.gz"
      sha256 "0318d491f58d18cdc6d561d6f0eff4bb41f25c1036e4adbfe9cb63fc88dc8bf0"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.31/openrouter-1.14.31-darwin-amd64.tar.gz"
      sha256 "731b9926a81bbea01741444a716a70cb503ab9734731ac2e48cac8e59d557eba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.31/openrouter-1.14.31-linux-arm64.tar.gz"
      sha256 "ceb2efa07d315df5c37b19fd91c95effd63f3ffac0f177a97c821ea18ce1c047"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.31/openrouter-1.14.31-linux-amd64.tar.gz"
      sha256 "53799964eff8586ba92be5c252d5b62aa355c32369f35b49beb5a6b30955522e"
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
