cask "nanoswitch" do
  version "1.3.1"
  sha256 "3f49ad42c1ac1dfebcc7a364ec39f8462f9b8179f03dda92c04634e7ad480076"

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
