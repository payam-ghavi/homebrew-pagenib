cask "pagenib" do
  version "0.9.17"
  sha256 "19a543e2ba6c55fcfbeb7182b6af0bdac72f7aa5f812cca12762fe8ce3965e90"

  url "https://github.com/payam-ghavi/pagenib-releases/releases/download/v#{version}/Pagenib-#{version}-mac.dmg",
      verified: "github.com/payam-ghavi/pagenib-releases/"
  name "Pagenib"
  desc "PDF viewer and editor for construction drawings: measure, mark up and sign"
  homepage "https://pagenib.com/"

  livecheck do
    url "https://github.com/payam-ghavi/pagenib-releases/releases/latest/download/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Pagenib.app"

  zap trash: [
    "~/Library/Application Support/Pagenib",
    "~/Library/Preferences/com.pagenib.Pagenib.plist",
    "~/Library/Saved Application State/ca.ghavi.pagenib.savedState",
  ]
end
