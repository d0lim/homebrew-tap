cask "organ" do
  version "0.0.1-alpha9"
  sha256 "57597daa93e05c4b9140f0352420c58de23d0ddbba797aff0ce0583e187258dd"

  url "https://github.com/d0lim/homebrew-tap/releases/download/organ-v#{version}/Organ-#{version}-arm64.zip"
  name "Organ"
  desc "Personal PKM and to-do app: capture, Inbox, Today, notes — every write is an event"
  homepage "https://github.com/d0lim/organ"

  livecheck do
    skip "Organ release tags share this tap with other projects."
  end

  depends_on arch: :arm64
  depends_on macos: :golden_gate

  app "Organ.app"

  zap trash: [
    "~/Library/Application Support/Organ",
  ]
end
