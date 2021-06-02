cask 'pe-client-tools' do
  case MacOS.version
  when '10.14'
    os_ver = '10.14'
    version '21.1.0'
    sha256 'b8a808800091e481cf5b779d795203c84f8caabdaf8608ad6d7af23c136aa30e'
  else
    os_ver = '10.15'
    version '21.1.0'
    sha256 '212568a6af374e40537c7180ae28d2083dc4f1ef8bbf26654019b1033a52d06c'
  end

  depends_on macos: '>= :mojave'
  url "https://pm.puppet.com/pe-client-tools/2021.1.0/#{version}/repos/apple/#{os_ver}/PC1/x86_64/pe-client-tools-#{version}-1.osx#{os_ver}.dmg"
  pkg "pe-client-tools-#{version}-1-installer.pkg"

  name 'PE Client Tools'
  homepage "https://puppet.com/docs/pe/latest/installing_pe_client_tools.html"

  uninstall pkgutil: 'com.puppetlabs.pe-client-tools'
end
