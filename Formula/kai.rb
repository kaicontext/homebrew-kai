class Kai < Formula
  desc "Semantic infrastructure for code change — call graphs, impact analysis, and AI context"
  homepage "https://kailayer.com"
  version "0.36.52"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kaicontext/kai-cli/releases/download/v#{version}/kai-darwin-arm64.gz"
      sha256 "52929fb6997a055cb332c12cc1552bc01eb0d2ac0438f1bba3e90d5c32ce4e70"
    else
      url "https://github.com/kaicontext/kai-cli/releases/download/v#{version}/kai-darwin-amd64.gz"
      sha256 "b22a37e82e3831aa2f0b3c1e4257ffe529741f4a3e3c901aead691652522944e"
    end
  end

  on_linux do
    url "https://github.com/kaicontext/kai-cli/releases/download/v#{version}/kai-linux-amd64.gz"
    sha256 "5496d60251b542b5534d789bbb47ca7dff3fc7efb0cbb9b61dba6a8bc9125baa"
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
