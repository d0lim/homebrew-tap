cask "organ" do
  version "0.0.1-alpha3"
  sha256 "22434eda4b83dece1e8dae8e860db676d3625c16dcc43b633c1d6586fc320687"

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
end
