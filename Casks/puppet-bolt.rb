cask 'puppet-bolt' do
  version '0.21.6'

  case MacOS.version.to_sym
  when :el_capitan
    sha256 'ea2a4cfed3e2b5c35020788506fd195166083aeef0d9d45a8f3522c9cd129727'
  when :sierra
    sha256 '20c9a2abc3ddfcbc8d94681222cad7814fe4881bff51d571e3ce256aecbdcb14'
  when :high_sierra
    sha256 '7bd2f8e73b4526616cdc6f87fc355dc1cb2ae6a79075e86a2c83d08040b1b3f9'
  end

  url "https://downloads.puppet.com/mac/puppet5/#{MacOS.version}/x86_64/puppet-bolt-#{version}-1.osx#{MacOS.version}.dmg"
  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  depends_on macos: '>= 10.11'

  pkg "puppet-bolt-#{version}-1-installer.pkg"

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
