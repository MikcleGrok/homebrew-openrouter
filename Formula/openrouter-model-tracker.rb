class OpenrouterModelTracker < Formula
  desc "Regenerate the OpenRouter model comparison document from live data"
  homepage "https://openrouter.ai/"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.34/openrouter-1.14.34-darwin-arm64.tar.gz"
      sha256 "94209c890fd697d2a5acfbb7b5c4e9094c56848071fec305995cb6f43fc5f0ef"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.34/openrouter-1.14.34-darwin-amd64.tar.gz"
      sha256 "7eac3bceafc42ebad46f80b686e7ab08dc5c78f6c5aaaed07b34dd51146b2887"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.34/openrouter-1.14.34-linux-arm64.tar.gz"
      sha256 "2889a83d7cbf3ab8503c802d07ab2192420357abcf00d0dab9411ab24b7fbd2e"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.34/openrouter-1.14.34-linux-amd64.tar.gz"
      sha256 "3b73b329ef29e7c0cac77f1c3f3ee41dbbe1468ada71b8284f143defee2ad571"
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
