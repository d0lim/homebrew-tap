cask "cockpit" do
  version "0.8.0"

  on_macos do
    on_arm do
      sha256 "7a8c32d5b6f5d99079a0196b78f38027f9ae33eca9edccb042385051b874769f"
      url "https://github.com/d0lim/cockpit/releases/download/v#{version}/cockpit_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "209ce538c70b51b1f36e062212059a614bca55534dacee2b1a4cdf948a6e7938"
      url "https://github.com/d0lim/cockpit/releases/download/v#{version}/cockpit_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "61a63ffe053138facc2fcc3ee6512d951a60b0232d2a7af83ee73f141fc4ad66"
      url "https://github.com/d0lim/cockpit/releases/download/v#{version}/cockpit_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "921abe876b57d9c8b2b83680d203a46231223aa7fa3737cdb8ba5363e43e68fa"
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
