cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.4.0'
    sha256 'c3cf86503d9cb31cdb86b9ad9c3db2921c395058a8cc52503633b9c9c1b33322'
  when '10.12'
    os_ver = '10.12'
    version '1.4.0'
    sha256 'c218310990ca82285d4583a7a03488e530f4181bc7fcada5a50796a3cbf7d282'
  else
    os_ver = '10.13'
    version '1.4.0'
    sha256 '8fd7353275c96307ef6f3079773be9dee7a448f6c92b01e86e9c94acdcd6da4c'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{os_ver}/x86_64/puppet-bolt-#{version}-1.osx#{os_ver}.dmg"
  pkg "puppet-bolt-#{version}-1-installer.pkg"

  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
