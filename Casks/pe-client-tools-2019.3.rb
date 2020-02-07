cask 'pe-client-tools-2019.3' do
  case MacOS.version
  when '10.12'
    os_ver = '10.12'
    version '19.3.0'
    sha256 'd784e74325079ebecdbbc72ab5214c7f54be8ae1a38a6d4954bf52f7c02b1142'
  else
    os_ver = '10.13'
    version '19.3.0'
    sha256 'bccf0c588dd7d5e9dab92716e8471214c381e60f4f9246ba605091b253fb59f5'
  end

  depends_on macos: '>= :sierra'
  url "https://pm.puppet.com/pe-client-tools/2019.3.0/#{version}/repos/apple/#{os_ver}/PC1/x86_64/pe-client-tools-#{version}-1.osx#{os_ver}.dmg"
  pkg "pe-client-tools-#{version}-1-installer.pkg"

  name 'PE Client Tools'
  homepage "https://puppet.com/docs/pe/2019.3/installing_pe_client_tools.html"

  uninstall pkgutil: 'com.puppetlabs.pe-client-tools'
end
