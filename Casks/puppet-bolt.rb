cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '0.25.0'
    sha256 '46ec2baf382807ce787b2bb9fa778a90759c8c268d6ff3cb117fa12416cafbb1'
  when '10.12'
    os_ver = '10.12'
    version '0.25.0'
    sha256 '0afa6ccc449086f514bdab010e4ce8c3db2ef97a243fbc4fcbde8e12be6befd6'
  else
    os_ver = '10.13'
    version '0.25.0'
    sha256 'debbb942f2b3578a747c260811f6907c901ec520dbbaf10d94c2cbd57ff1aeb4'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{os_ver}/x86_64/puppet-bolt-#{version}-1.osx#{os_ver}.dmg"
  pkg "puppet-bolt-#{version}-1-installer.pkg"

  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
