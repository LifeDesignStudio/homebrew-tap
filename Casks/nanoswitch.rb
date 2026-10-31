cask "nanoswitch" do
  version "1.3.0"
  sha256 "1faf8a53a07c8c5ecd0808825ae8a175e62ce2e46f02d18680c710ce539fc4f2"

  url "https://github.com/LifeDesignStudio/NanoSwitch/releases/download/v#{version}/NanoSwitch.dmg"
  name "NanoSwitch"
  desc "Simpler, more beautiful Cmd+Tab that switches by window"
  homepage "https://github.com/LifeDesignStudio/NanoSwitch"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Sparkle で自動更新するため Homebrew 側の更新管理はしない
  auto_updates true
  depends_on macos: :sonoma

  app "NanoSwitch.app"

  caveats <<~EOS
    NanoSwitch needs two permissions on first launch, granted in
    System Settings > Privacy & Security:
      - Accessibility   (to intercept Cmd+Tab)
      - Screen Recording (for window thumbnails)
  EOS

  zap trash: [
    "~/Library/Preferences/com.lifedesign.nanoswitch.plist",
  ]
end
