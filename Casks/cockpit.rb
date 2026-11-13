cask "cockpit" do
  version "0.3.0"

  on_macos do
    on_arm do
      sha256 "fca00a82262a6a496ea4b623973736248da9672830e4636412d13b0dc910c603"
      url "https://github.com/d0lim/cockpit/releases/download/v#{version}/cockpit_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "e6dbf985cd9a42db85e2631eaa5a43c4cb8dff97c610c1520836c162f9d58945"
      url "https://github.com/d0lim/cockpit/releases/download/v#{version}/cockpit_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "f2159b451fcec328b2c549db4f2ab2203e05d6df3d6383465ef01b4366ad1aa8"
      url "https://github.com/d0lim/cockpit/releases/download/v#{version}/cockpit_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "5c699f9795e62d2a735d5cee6798e121a471855d4bdc2afc0407c6bc01c4e17f"
      url "https://github.com/d0lim/cockpit/releases/download/v#{version}/cockpit_#{version}_linux_amd64.tar.gz"
    end
  end

  name "cockpit"
  desc "Runs end-to-end flows against a compose stack"
  homepage "https://github.com/d0lim/cockpit"

  livecheck do
    url :homepage
    strategy :github_latest
  end

  binary "cockpit"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr",
                     args: ["-dr", "com.apple.quarantine", "#{staged_path}/cockpit"]
    end
  end
end
