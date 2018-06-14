cask 'puppet-bolt' do
  version '0.20.7'

  if MacOS.version == :el_capitan
    sha256 '42b7f765bda7cf258d72a1a8cd5caec5c3f9f0164ac5f6c658fcce7dd0959c5d'
  elsif MacOS.version == :sierra
    sha256 '5727f6f08a99533ac1e65fb3f352d0f0f18fde74f97ae937fb3ad187ab88c632'
  else
    sha256 'c037f361cee110d38c1378b1b82a7306200daaecf8d4094c430d1df152910c1c'
  end

  # downloads.puppetlabs.com/mac was verified as official when first introduced to the cask
  url "http://downloads.puppetlabs.com/mac/#{MacOS.version}/PC1/x86_64/puppet-bolt-#{version}-1.osx#{MacOS.version}.dmg"
  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  depends_on macos: '>= 10.11'

  pkg "puppet-bolt-#{version}-1-installer.pkg"

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
