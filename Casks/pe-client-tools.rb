cask 'pe-client-tools' do
  case MacOS.version
  when '10.14'
    os_ver = '10.14'
    version '21.0.0'
    sha256 'ca433c154a329c5fb57d46459f7086974bfe9d9b1966b9961a44ac739b7d09d9'
  else
    os_ver = '10.15'
    version '21.0.0'
    sha256 '4c0b9bcb5a14159e93b82e02bc27c6f3ce80291f3b74fb0ce50f2dbf1727d7d4'
  end

  depends_on macos: '>= :mojave'
  url "https://pm.puppet.com/pe-client-tools/2021.0.0/#{version}/repos/apple/#{os_ver}/PC1/x86_64/pe-client-tools-#{version}-1.osx#{os_ver}.dmg"
  pkg "pe-client-tools-#{version}-1-installer.pkg"

  name 'PE Client Tools'
  homepage "https://puppet.com/docs/pe/latest/installing_pe_client_tools.html"

  uninstall pkgutil: 'com.puppetlabs.pe-client-tools'
end
