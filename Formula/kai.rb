class Kai < Formula
  desc "Semantic infrastructure for code change — call graphs, impact analysis, and AI context"
  homepage "https://kailayer.com"
  version "0.36.51"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kaicontext/kai-cli/releases/download/v#{version}/kai-darwin-arm64.gz"
      sha256 "470d39d7e4e2c192ed75b69287c586a7df55f02cdc911ade9238dc4c2756ac28"
    else
      url "https://github.com/kaicontext/kai-cli/releases/download/v#{version}/kai-darwin-amd64.gz"
      sha256 "b3c84677f71e176d1e96832c1705da5c58bc2aeb8460efa25dee35e66e693191"
    end
  end

  on_linux do
    url "https://github.com/kaicontext/kai-cli/releases/download/v#{version}/kai-linux-amd64.gz"
    sha256 "bfc246ecc6c38b4dfc21e82e7eab9c0a5c81d3ba2f0f8f6b04ed89726edc312f"
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
