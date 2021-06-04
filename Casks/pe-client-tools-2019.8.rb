cask 'pe-client-tools-2019.8' do
  case MacOS.version
  when '10.14'
    os_ver = '10.14'
    version '19.8.6'
    sha256 'ce9c2db02c9fbb6b1cbf6ba9be4a2c569aa485a563350718a4435dc2a8185f3d'
  else
    os_ver = '10.15'
    version '19.8.6'
    sha256 '3cb72c8ac071b46b8b60a40a2018b44346205b386a1ee07e2006cd66ce98e3cb'
  end

  depends_on macos: '>= :mojave'
  url "https://pm.puppet.com/pe-client-tools/2019.8.6/#{version}/repos/apple/#{os_ver}/PC1/x86_64/pe-client-tools-#{version}-1.osx#{os_ver}.dmg"
  pkg "pe-client-tools-#{version}-1-installer.pkg"

  name 'PE Client Tools'
  homepage "https://puppet.com/docs/pe/2019.8/installing_pe_client_tools.html"

  uninstall pkgutil: 'com.puppetlabs.pe-client-tools'
end
