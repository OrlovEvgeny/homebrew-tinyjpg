class Tinyjpg < Formula
  desc "Cross-platform image optimizer"
  homepage "https://github.com/OrlovEvgeny/TinyJPG"
  version "1.0.1"

  url "https://tinyjpg.eorlov.org/tinyjpg/#{version}/tinyjpg-#{version}-macos-arm64.tar.gz"
  sha256 "e9b552fc842cdabac21a58041fb97bf41237f9d282a615043216d5726791ecaa"

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
