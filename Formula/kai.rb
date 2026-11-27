class Kai < Formula
  desc "Semantic infrastructure for code change — call graphs, impact analysis, and AI context"
  homepage "https://kailayer.com"
  version "0.36.53"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/kaicontext/kai-cli/releases/download/v#{version}/kai-darwin-arm64.gz"
      sha256 "7bab6d32db274f629af5ef5b1d716885e067da477b16c4fa2f2e87c6f521ad33"
    else
      url "https://github.com/kaicontext/kai-cli/releases/download/v#{version}/kai-darwin-amd64.gz"
      sha256 "061e22e06f7307883ec8311fdf05c96150063e428243ebbf404546fbd1cc4ca3"
    end
  end

  on_linux do
    url "https://github.com/kaicontext/kai-cli/releases/download/v#{version}/kai-linux-amd64.gz"
    sha256 "4607c65dd42df612cd3547b443582fce9a40c9e7f86c976ec23b0c0851a4c38f"
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
