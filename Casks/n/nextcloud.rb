cask "nextcloud" do
  on_big_sur :or_older do
    version "3.8.1"
    sha256 "448647db0068ff9a2b669ff2f9d715a36b4e5e1af82e9849e57d9f7078d1bd2e"

    livecheck do
      skip "Legacy version"
    end
  end
  on_monterey :or_newer do
    version "3.16.6"
    sha256 "3e5a1e2f83286f442b2f6c138faa27272ee5cf4831708d295b9bca70326961c8"

    livecheck do
      url "https://download.nextcloud.com/desktop/releases/Mac/Installer/"
      regex(/href=.*?Nextcloud[._-]v?(\d+(?:\.\d+)+)\.pkg/i)
    end
  end

  url "https://download.nextcloud.com/desktop/releases/Mac/Installer/Nextcloud-#{version}.pkg"
  name "Nextcloud"
  desc "Desktop sync client for Nextcloud software products"
  homepage "https://nextcloud.com/"

  auto_updates true
  conflicts_with cask: "nextcloud-vfs"
  depends_on macos: ">= :mojave"

  pkg "Nextcloud-#{version}.pkg"
  binary "/Applications/Nextcloud.app/Contents/MacOS/nextcloudcmd"

  uninstall launchctl: "com.nextcloud.desktopclient",
            quit:      "com.nextcloud.desktopclient",
            pkgutil:   "com.nextcloud.desktopclient",
            delete:    "/Applications/Nextcloud.app"

  zap trash: [
    "~/Library/Application Scripts/com.nextcloud.desktopclient.FinderSyncExt",
    "~/Library/Application Support/Nextcloud",
    "~/Library/Caches/Nextcloud",
    "~/Library/Containers/com.nextcloud.desktopclient.FinderSyncExt",
    "~/Library/Group Containers/com.nextcloud.desktopclient",
    "~/Library/Preferences/com.nextcloud.desktopclient.plist",
    "~/Library/Preferences/Nextcloud",
  ]
end
