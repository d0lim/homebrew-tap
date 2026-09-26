cask "organ" do
  version "0.0.1-alpha2"
  sha256 "36edf1d83de30b463d4151f1213593307a197d7a97e8ba2007d1b6cdabe62730"

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
