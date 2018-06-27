cask 'puppet-bolt' do
  version '0.21.1'

  if MacOS.version == :el_capitan
    sha256 '83ad517f7f79723df16fcf053bf281bf314952c2dd110d6ca2fefc4e05393ca1'
  elsif MacOS.version == :sierra
    sha256 '6c5089047ddf6fdb418a47def0931facc6e281cf61c3cf63ae8d6cd0c4dedd42'
  else
    sha256 '0830d076d51cb3e4628d66474cb65e450ccc9684941c5aec2faf98eb06701835'
  end

  # downloads.puppetlabs.com/mac was verified as official when first introduced to the cask
  url "http://downloads.puppetlabs.com/mac/puppet5/#{MacOS.version}/x86_64/puppet-bolt-#{version}-1.osx#{MacOS.version}.dmg"
  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  depends_on macos: '>= 10.11'

  pkg "puppet-bolt-#{version}-1-installer.pkg"

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
