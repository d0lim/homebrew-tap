cask "cockpit" do
  version "0.7.1"

  on_macos do
    on_arm do
      sha256 "02b465215a11d05264a06297102d13df6d2d1104ac20d575857ad3835e736885"
      url "https://github.com/d0lim/cockpit/releases/download/v#{version}/cockpit_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "0ef8e8ea85e9b55b47ebf9976c04ed62cd39ea73b3a6d128ab4e5db3afb64b46"
      url "https://github.com/d0lim/cockpit/releases/download/v#{version}/cockpit_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "85bce139301de6ae0c94e7b074fb04f5d38f6c5a291b7031ceed749bbf8028c1"
      url "https://github.com/d0lim/cockpit/releases/download/v#{version}/cockpit_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "afe81f1026e6346c4630b203b8a7d18fa3689099fab3ae043f356bc65cd78e01"
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
