class Tinyjpg < Formula
  desc "Cross-platform image optimizer"
  homepage "https://github.com/OrlovEvgeny/TinyJPG"
  version "0.1.0"

  url "https://tinyjpg.eorlov.org/tinyjpg/#{version}/tinyjpg-#{version}-macos-arm64.tar.gz"
  sha256 "TO_BE_FILLED_BY_RELEASE"

  def install
    bin.install "tinyjpg"
    bin.install "tj"
  end

  service do
    run [opt_bin/"tinyjpg", "watch", "--config", etc/"tinyjpg/tinyjpg.toml"]
    keep_alive true
    log_path var/"log/tinyjpg/out.log"
    error_log_path var/"log/tinyjpg/err.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tinyjpg --version")
  end
end
