cask "cockpit" do
  version "0.4.0"

  on_macos do
    on_arm do
      sha256 "2bd1f328b911ca011d534aebfdc2c2338f97b1903f08503e128019346856f5f8"
      url "https://github.com/d0lim/cockpit/releases/download/v#{version}/cockpit_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "e3f7d869f7bb261515e11af95e74bd7a8916213f8ba4c1b408859293f5f833a7"
      url "https://github.com/d0lim/cockpit/releases/download/v#{version}/cockpit_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "c9648ad781a84a7e18c9c0ba1c846f057af386e2407a45fbc90457d202ee8df7"
      url "https://github.com/d0lim/cockpit/releases/download/v#{version}/cockpit_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "d530bd0d739bc7bd3dd28256d865257c1297802baf3c67f0cdf53775138ae29e"
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
