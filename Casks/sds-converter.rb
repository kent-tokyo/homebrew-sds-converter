cask "sds-converter" do
  version "0.2.0"
  sha256 "a21538ca4ce05ad7b748c4a6dba135c204a1bede388a410a52fc0110eb8cbe5b"

  url "https://github.com/kent-tokyo/sds-converter/releases/download/v#{version}/sds-converter-macos.zip"
  name "SDS Converter"
  desc "SDS document converter for JIS Z 7253 standard"
  homepage "https://github.com/kent-tokyo/sds-converter"

  app "sds-converter.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/sds-converter.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.sds-converter.app.plist",
  ]
end
