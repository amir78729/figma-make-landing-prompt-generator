class LandingPromptGen < Formula
  desc "Generate filled prompts from templates by fetching API data"
  homepage "https://github.com/amir78729/figma-make-landing-prompt-generator"
  url "https://github.com/amir78729/figma-make-landing-prompt-generator/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "c98b6903961dd858495f50a41120d2e14bc7e1e93b2df37bd653ed5b7043c743"
  version "0.0.1"

  def install
    bin.install "generate-prompt.sh" => "landing-prompt-gen"
    pkgshare.install "templates"
  end

  test do
    system "#{bin}/landing-prompt-gen", "--help"
  end
end
