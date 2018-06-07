cask 'puppet-bolt' do
  version '0.20.6'

  if MacOS.version == :el_capitan
    sha256 '70656920c0d03c7363df752f03ae00c7ca5d3bde941d8671cf3a264d397cd86c'
  elsif MacOS.version == :sierra
    sha256 '9451360b8820fbbb8de60e6ef66b0dbec7ae020bee4de5904d1c3abf863ad8c4'
  else
    sha256 'bbe5761c7686c60e07c6c4769aa414e6f03ebd161fb014210bd66949f0d93254'
  end

  # downloads.puppetlabs.com/mac was verified as official when first introduced to the cask
  url "http://downloads.puppetlabs.com/mac/#{MacOS.version}/PC1/x86_64/puppet-bolt-#{version}-1.osx#{MacOS.version}.dmg"
  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  depends_on macos: '>= 10.11'

  pkg "puppet-bolt-#{version}-1-installer.pkg"

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
