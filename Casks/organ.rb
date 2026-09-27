cask "organ" do
  version "0.0.1-alpha4"
  sha256 "5b500bfe066c452a3ecc72df3dd08bf4b1ba1a742ec8cf10fb710754b8e2782e"

  url "https://github.com/d0lim/homebrew-tap/releases/download/organ-v#{version}/Organ-#{version}-arm64.zip"
  name "Organ"
  desc "Personal workspace for tasks, projects, notes, and time planning"
  homepage "https://github.com/d0lim/homebrew-tap"

  livecheck do
    skip "Organ release tags share this tap with other projects."
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Organ.app"
end
