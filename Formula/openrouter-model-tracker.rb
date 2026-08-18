class OpenrouterModelTracker < Formula
  desc "Regenerate the OpenRouter model comparison document from live data"
  homepage "https://openrouter.ai/"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.32/openrouter-1.14.32-darwin-arm64.tar.gz"
      sha256 "ab61379e66504459e6e1f01bc0d1aae2e4f38651644013e51cab4fa50806ef76"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.32/openrouter-1.14.32-darwin-amd64.tar.gz"
      sha256 "71d1ddfb7f3421e6c99514706682353b70980fc867fe1dd65b2f83c62508c0e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.32/openrouter-1.14.32-linux-arm64.tar.gz"
      sha256 "454d3339dda32120117079bf9d100a9ee6be998ba97dbd48639088be08394636"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.32/openrouter-1.14.32-linux-amd64.tar.gz"
      sha256 "72d8eb390f26da1576ba45db9ed04da5baccb04ace0fe34dfeb0a5232ea16f9b"
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
