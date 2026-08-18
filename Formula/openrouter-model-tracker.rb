class OpenrouterModelTracker < Formula
  desc "Regenerate the OpenRouter model comparison document from live data"
  homepage "https://openrouter.ai/"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.33/openrouter-1.14.33-darwin-arm64.tar.gz"
      sha256 "03b94abd45d88146d07b1f9c0d4a4f9cc67cee3135a43c0f4a2ace8aa1a012e2"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.33/openrouter-1.14.33-darwin-amd64.tar.gz"
      sha256 "b355428b566d39acb2e0980caa6317ff5bc73d7f8e1d4de3be9f0a4cf831e355"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.33/openrouter-1.14.33-linux-arm64.tar.gz"
      sha256 "48ce008c6a63387ba7ba5708770408ccede7b7fa9c807a00ba54c99eb0054263"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.33/openrouter-1.14.33-linux-amd64.tar.gz"
      sha256 "b65b975333fa552c0538008ac06150061e19ea3b7be4563d21b3db3e0f954a13"
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
