cask "emclient" do
  version "9.2.1611"
  sha256 "c898a006b708af4ebd60abe65f14cebbc7c7efe7116ca515851d922c11b006c6"

  url "https://cdn-dist.emclient.com/dist/v#{version}_Mac/setup.pkg"
  name "eM Client"
  desc "Email client"
  homepage "https://www.emclient.com/"

  livecheck do
    url "https://www.emclient.com/dist/latest/setup.pkg"
    strategy :header_match do |headers|
      headers["location"][/v?(\d+(?:\.\d+)+)_Mac/i, 1]
    end
  end

  auto_updates true

  pkg "setup.pkg"

  uninstall delete:  "/Applications/eM Client.app",
            pkgutil: "com.emclient.mail.client.pkg"

  zap trash: [
    "~/Library/Caches/com.emclient.mail.client",
    "~/Library/Preferences/com.emclient.mail.client.plist",
    "~/Library/Preferences/com.emclient.mail.repair.plist",
    "~/Library/Preferences/com.emclient.mail.shared.plist",
    "~/Library/Saved Application State/com.emclient.mail.client.savedState",
  ]
end
