cask "organ" do
  version "0.0.1-alpha8"
  sha256 "fcf54d9f68aaa090e10c62c5a1baaa79bd68f4a5a4279608d29121cf492c1488"

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
