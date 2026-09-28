cask "organ" do
  version "0.0.1-alpha5"
  sha256 "014c7a37b459e4053fdc2891da6101a672ace8fd5e6e74d22c27d8510f839acd"

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
