cask 'puppet-bolt' do
  version '0.20.6'

  if MacOS.version == :el_capitan
    sha256 'b628650adcdcf01e67a2e469e53422ba8df39d763faa60302165b08f07ce6687'
  elsif MacOS.version == :sierra
    sha256 '83cbc6c3b40d5e19023adb294c8c8d5ab7c0b6ea735aa95411b6f1da1a9108ff'
  else
    sha256 '5c8a1e13808ad623f5d2265312a40b1dedced806bb0500b887cd71929cd11fdd'
  end

  # downloads.puppetlabs.com/mac was verified as official when first introduced to the cask
  url "http://downloads.puppetlabs.com/mac/#{MacOS.version}/PC1/x86_64/puppet-bolt-#{version}-1.osx#{MacOS.version}.dmg"
  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  depends_on macos: '>= 10.11'

  pkg "puppet-bolt-#{version}-1-installer.pkg"

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
