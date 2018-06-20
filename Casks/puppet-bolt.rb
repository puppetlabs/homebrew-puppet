cask 'puppet-bolt' do
  version '0.21.0'

  if MacOS.version == :el_capitan
    sha256 'be717f4fc4c118d766179de13ca08ae146f1005ff51a1ae21bd371a23daeaba3'
  elsif MacOS.version == :sierra
    sha256 '203887bdd055aadccc5e82640d36959ab2fcebe1582c763492522188142c125c'
  else
    sha256 '0bca4b823bc225018c5c03b41cf93d1c8d6b6dd4b570a33cfe96f194a824f36c'
  end

  # downloads.puppetlabs.com/mac was verified as official when first introduced to the cask
  url "http://downloads.puppetlabs.com/mac/#{MacOS.version}/PC1/x86_64/puppet-bolt-#{version}-1.osx#{MacOS.version}.dmg"
  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  depends_on macos: '>= 10.11'

  pkg "puppet-bolt-#{version}-1-installer.pkg"

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
