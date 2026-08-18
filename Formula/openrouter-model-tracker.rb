class OpenrouterModelTracker < Formula
  desc "Regenerate the OpenRouter model comparison document from live data"
  homepage "https://openrouter.ai/"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.29/openrouter-1.14.29-darwin-arm64.tar.gz"
      sha256 "3c0b75183298967317fc77e2ce03901e1dd0ef99730240775d78f3578659c32a"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.29/openrouter-1.14.29-darwin-amd64.tar.gz"
      sha256 "79caa3cff3e95b0d0e29a5f26769a486e33eae247fa99588292ed2311a40cc61"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.29/openrouter-1.14.29-linux-arm64.tar.gz"
      sha256 "9b786a02508e4421313d7567e0d3a444262300337a312b91c0a305afd4a35420"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.29/openrouter-1.14.29-linux-amd64.tar.gz"
      sha256 "ec5c426a44e690c6f5726ae90817d74ef319ab5e604aa7cf99a619c2d3972a0f"
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
