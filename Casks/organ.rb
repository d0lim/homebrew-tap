cask "organ" do
  version "0.0.1-alpha1"
  sha256 "f2b81784315ad3dc1b6e58fe6f2d384151e77b646c22d53f95b410378d3f0de6"

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
  binary "#{appdir}/Organ.app/Contents/MacOS/organ-data"

  caveats <<~EOS
    Organ is ad-hoc signed and is not notarized. macOS may block its first launch.
    After attempting to open it, use System Settings > Privacy & Security >
    Open Anyway if you trust this release.
  EOS
end
