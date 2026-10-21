cask "cockpit" do
  version "0.1.0"

  on_macos do
    on_arm do
      sha256 "8f299cc58ee4eb72a13e8ac9800fb3e1f83a07634f500ffd9e08c01d7ae8c425"
      url "https://github.com/d0lim/cockpit/releases/download/v#{version}/cockpit_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "6f9b1ee31dda097a2ebac485ff882e3ff2aa80994a78ed5e74af2b3a3562b511"
      url "https://github.com/d0lim/cockpit/releases/download/v#{version}/cockpit_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "00332449b4be50c487588a915f45fd2dc17d358fd4d22505d38ab84747dee75c"
      url "https://github.com/d0lim/cockpit/releases/download/v#{version}/cockpit_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "ec9afd378fcd729b06639796e64c4a97355167688e69a4a08576911bfe93aa7c"
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
