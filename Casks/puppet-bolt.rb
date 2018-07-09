cask 'puppet-bolt' do
  version '0.21.2'

  if MacOS.version == :el_capitan
    sha256 'c002a2d10c7e2eb631e11f5ee687d737c851d75d9d9f48f2cca7cd3bc9ed1ee4'
  elsif MacOS.version == :sierra
    sha256 '9832d8e45f1821da1c2e4190a5c5ddf44131ea7d5455d75a00a38c0503bc3901'
  else
    sha256 '9e77f17dff6966156c60a88ef348251cd5f8f6fdb63ecb82e6c8a7fad051066b'
  end

  # downloads.puppetlabs.com/mac was verified as official when first introduced to the cask
  url "http://downloads.puppetlabs.com/mac/puppet5/#{MacOS.version}/x86_64/puppet-bolt-#{version}-1.osx#{MacOS.version}.dmg"
  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  depends_on macos: '>= 10.11'

  pkg "puppet-bolt-#{version}-1-installer.pkg"

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
