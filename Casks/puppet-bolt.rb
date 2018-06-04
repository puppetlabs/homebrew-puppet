cask 'puppet-bolt' do
  version '0.20.5'

  if MacOS.version == :el_capitan
    sha256 'c6cc953c582a5159460232c403f68927172d0165f293746943fa3e5d69acc687'
  elsif MacOS.version == :sierra
    sha256 '7be0182ff41a660fcdae026436a1f064cfbf88072b69435b76e5fb20785de6f7'
  else
    sha256 '7575c0b7adac3901c74db0a2d18f01a81192f9d2599e0ff82d9a1e3a77c9ab9f'
  end

  # downloads.puppetlabs.com/mac was verified as official when first introduced to the cask
  url "http://downloads.puppetlabs.com/mac/#{MacOS.version}/PC1/x86_64/puppet-bolt-#{version}-1.osx#{MacOS.version}.dmg"
  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  depends_on macos: '>= 10.11'

  pkg "puppet-bolt-#{version}-1-installer.pkg"

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
