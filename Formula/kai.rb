class Kai < Formula
  desc "Semantic infrastructure for code change — call graphs, impact analysis, and AI context"
  homepage "https://kailayer.com"
  version "0.36.54"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kaicontext/kai-cli/releases/download/v#{version}/kai-darwin-arm64.gz"
      sha256 "11782fbacbdb0d95a69e03b79eff6c03d420b3692aee5c1d1c7f1f880360f2e2"
    else
      url "https://github.com/kaicontext/kai-cli/releases/download/v#{version}/kai-darwin-amd64.gz"
      sha256 "da564fda99df53b59d78676cc53e71d670a45349515129db5f9f0fe2e005ed69"
    end
  end

  on_linux do
    url "https://github.com/kaicontext/kai-cli/releases/download/v#{version}/kai-linux-amd64.gz"
    sha256 "7bbc4a10c36e656f20677ce056029d8d0ae9d5cb72754effe6a0eb56cee287a4"
  end

  def install
    # The downloaded file is already gunzipped by Homebrew
    binary = Dir["kai-*"].first || "kai"
    bin.install binary => "kai"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kai version")
  end
end
