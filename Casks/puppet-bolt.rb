cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    version '0.21.6'
    sha256 'ea2a4cfed3e2b5c35020788506fd195166083aeef0d9d45a8f3522c9cd129727'
  when '10.12'
    version '0.21.6'
    sha256 '20c9a2abc3ddfcbc8d94681222cad7814fe4881bff51d571e3ce256aecbdcb14'
  when '10.13'
    version '0.21.6'
    sha256 '7bd2f8e73b4526616cdc6f87fc355dc1cb2ae6a79075e86a2c83d08040b1b3f9'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{MacOS.version}/x86_64/puppet-bolt-#{version}-1.osx#{MacOS.version}.dmg"
  pkg "puppet-bolt-#{version}-1-installer.pkg"

  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
