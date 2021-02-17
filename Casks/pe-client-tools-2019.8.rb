cask 'pe-client-tools-2019.8' do
  case MacOS.version
  when '10.14'
    os_ver = '10.14'
    version '19.8.5'
    sha256 'dd4aa20af10f27f2c5fe58a8ca512dead51eb7bfa00b186d301c67135b108692'
  else
    os_ver = '10.15'
    version '19.8.5'
    sha256 '5be345ca3691f00b97c54f3cd5e523260257cb1e0589733dc1694b6241e5a7bb'
  end

  depends_on macos: '>= :mojave'
  url "https://pm.puppet.com/pe-client-tools/2019.8.0/#{version}/repos/apple/#{os_ver}/PC1/x86_64/pe-client-tools-#{version}-1.osx#{os_ver}.dmg"
  pkg "pe-client-tools-#{version}-1-installer.pkg"

  name 'PE Client Tools'
  homepage "https://puppet.com/docs/pe/2019.8/installing_pe_client_tools.html"

  uninstall pkgutil: 'com.puppetlabs.pe-client-tools'
end
