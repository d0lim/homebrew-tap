cask "cockpit" do
  version "0.2.0"

  on_macos do
    on_arm do
      sha256 "f909c45f202059d9b555702faf74715ac254a3baf28745d8689d1a95366a8a25"
      url "https://github.com/d0lim/cockpit/releases/download/v#{version}/cockpit_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "b5313fb39ca3d5dd11456443bd64b392c2bed3b96914c87062c98f8836747636"
      url "https://github.com/d0lim/cockpit/releases/download/v#{version}/cockpit_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "752201a52fe74e2428f4eda9b88674a9b458c9f08fb3d6fdee072761b6014a17"
      url "https://github.com/d0lim/cockpit/releases/download/v#{version}/cockpit_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "cd55ecc1013fbdbacebd797dca12b9bb6b787fe9f85ccf535cfc0d7d2e853d3d"
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
