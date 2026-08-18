class OpenrouterModelTracker < Formula
  desc "Regenerate the OpenRouter model comparison document from live data"
  homepage "https://openrouter.ai/"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.26/openrouter-1.14.26-darwin-arm64.tar.gz"
      sha256 "11b9672348428968e2ddc641f860fdf76caacf87ba377935b938919c861280e7"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.26/openrouter-1.14.26-darwin-amd64.tar.gz"
      sha256 "f46edb17faa5ace5f59dfd1ed3d410c997d950832078c84076a2b7b180ae5f11"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.26/openrouter-1.14.26-linux-arm64.tar.gz"
      sha256 "f7ffab9d76d7718f256f853489109ad5ca7ad3c38c7c571c9d66e37520c6c972"
    end
    on_intel do
      url "https://github.com/MikcleGrok/openrouter-model-tracker/releases/download/v1.14.26/openrouter-1.14.26-linux-amd64.tar.gz"
      sha256 "8ca49e45c86fff62a4d79b2c2a5985ba115fd248bccb9cb30a006c1a6f361d0d"
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
