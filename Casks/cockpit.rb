cask "cockpit" do
  version "0.5.0"

  on_macos do
    on_arm do
      sha256 "c71b2cba287e734939bb8b46bc460e0cda86032c76079f829d92e7c3f638c158"
      url "https://github.com/d0lim/cockpit/releases/download/v#{version}/cockpit_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "c37de71582fd16465865ed2fdae0ee6f9f804df322a48c39d12824d70bf7aaf5"
      url "https://github.com/d0lim/cockpit/releases/download/v#{version}/cockpit_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "5201c99550099adb64f8977baa9443fd04bcfaec65ca2665f1c2dfe53a46cc6c"
      url "https://github.com/d0lim/cockpit/releases/download/v#{version}/cockpit_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "1d1ce64902098b27c3e62df7624e76c1d6845d4776a7d8b6c2b44bb4f32f39e6"
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
