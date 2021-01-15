cask 'pe-client-tools-2018.1' do
  case MacOS.version
  when '10.12'
    os_ver = '10.12'
    version '18.1.8'
    sha256 'dab4d62b803bc322ce07c66820f443e1f85a967f77b752cf55262a500c1dce1a'
  else
    os_ver = '10.13'
    version '18.1.8'
    sha256 '327891491b80567b2af035de53422f81e010e727373f055f13626eb10c9c4553'
  end

  depends_on macos: '>= :sierra'
  url "https://pm.puppet.com/pe-client-tools/2018.1.0/#{version}/repos/apple/#{os_ver}/PC1/x86_64/pe-client-tools-#{version}-1.osx#{os_ver}.dmg"
  pkg "pe-client-tools-#{version}-1-installer.pkg"

  name 'PE Client Tools'
  homepage "https://puppet.com/docs/pe/2018.1/installing_pe_client_tools.html"

  uninstall pkgutil: 'com.puppetlabs.pe-client-tools'
end
