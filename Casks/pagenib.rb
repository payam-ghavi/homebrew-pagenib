cask "pagenib" do
  version "0.9.18"
  sha256 "95d9fbcd16a746a7be1de0a5eaab96552ff86be67400d45fc330785eeb4298d8"

  url "https://github.com/payam-ghavi/pagenib-releases/releases/download/v#{version}/Pagenib-#{version}-mac.dmg"
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
