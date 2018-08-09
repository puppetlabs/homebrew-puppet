cask 'pdk' do
  case MacOS.version
  when '10.11'
    version '1.7.0.0'
    sha256 '451fc9fda86bd8df0a1be72c6145f433828075e304750df125b47e4c30a3567e'
  when '10.12'
    version '1.7.0.0'
    sha256 'ae81c8fe3009d1e74fca4c81e8d635f86207dd8c40f2af057b7544c825e8b8b2'
  when '10.13'
    version '1.7.0.0'
    sha256 '484d8a317db2074d10c0c89818bbf712412e2bb493ae6464a6575990f114211b'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{MacOS.version}/x86_64/pdk-#{version}-1.osx#{MacOS.version}.dmg"
  pkg "pdk-#{version}-1-installer.pkg"

  name 'Puppet Development Kit'
  homepage 'https://github.com/puppetlabs/pdk'

  uninstall pkgutil: 'com.puppetlabs.pdk'
end
