cask "cockpit" do
  version "0.8.1"

  on_macos do
    on_arm do
      sha256 "60af0f6c1fde7fcee3c2ba04b01f0475f87771295a04118002ebc8f2d4a359ee"
      url "https://github.com/d0lim/cockpit/releases/download/v#{version}/cockpit_#{version}_darwin_arm64.tar.gz"
    end
    on_intel do
      sha256 "5609e1bc797d2dbec9a56d101f57feacaac468c1000c4af48e2c3da4893f2204"
      url "https://github.com/d0lim/cockpit/releases/download/v#{version}/cockpit_#{version}_darwin_amd64.tar.gz"
    end
  end
  on_linux do
    on_arm do
      sha256 "5a82390afae3bc1e28a2488ab7579bf21bbeee72fb5db2e19f88e33ba550abde"
      url "https://github.com/d0lim/cockpit/releases/download/v#{version}/cockpit_#{version}_linux_arm64.tar.gz"
    end
    on_intel do
      sha256 "96ce545ab7e12fa6e2160e09f34b7e82dfe59d3a616dc82a8d710245f702a791"
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
