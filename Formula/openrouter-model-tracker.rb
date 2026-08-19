class OpenrouterModelTracker < Formula
  desc "Regenerate the OpenRouter model comparison document from live data"
  homepage "https://openrouter.ai/"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.35/openrouter-1.14.35-darwin-arm64.tar.gz"
      sha256 "673dd64a04f4af62e461404637f214b77ff254ba14c15e40f12ef6fdbe2f688c"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.35/openrouter-1.14.35-darwin-amd64.tar.gz"
      sha256 "db3aeec4b1edb8f995dc7d5388143198eaadc94758070443b39de749484c54d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.35/openrouter-1.14.35-linux-arm64.tar.gz"
      sha256 "85fd2c1bc63f253507e35efcddbd9ec77e664c9ec95c07f4f57ad02d3afcae2c"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.35/openrouter-1.14.35-linux-amd64.tar.gz"
      sha256 "525f5a890eb423e39df1cd370a03fef10aaf4be6766b5e7440a0817db84a9c27"
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
