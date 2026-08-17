class OpenrouterModelTracker < Formula
  desc "Regenerate the OpenRouter model comparison document from live data"
  homepage "https://openrouter.ai/"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.21/openrouter-1.14.21-darwin-arm64.tar.gz"
      sha256 "b150c50d895b99663704e647ad13e6968e629eb24343ebc0dd7517580e1fed36"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.21/openrouter-1.14.21-darwin-amd64.tar.gz"
      sha256 "c16e6dd41ddbde6a877ca376c50a95fc2aa49e37ea9c9068d88ce7ee25644e09"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.21/openrouter-1.14.21-linux-arm64.tar.gz"
      sha256 "4dad226bee0462da228d76acdfeef392b8f5218a2e77a40b82454cc47ee5f6b8"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.21/openrouter-1.14.21-linux-amd64.tar.gz"
      sha256 "7a3b0a34b6db2e8a650c2f96f6a5a115beaf3638e78866ecfc31ede58d384845"
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
