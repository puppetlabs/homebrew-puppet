cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.5.0'
    sha256 '11f06847957006c79cff98761b8d23c3f94441d81f60e64ffaa160a251565a1b'
  when '10.12'
    os_ver = '10.12'
    version '1.5.0'
    sha256 '23a75622e57d26d5ed073005e779f101c2c4f23da08a3bbce115705d1bbc572a'
  else
    os_ver = '10.13'
    version '1.5.0'
    sha256 'f161319887a97ebde6b3e519dbde70ede98f215bd1da49173fc07f8213b1fb8e'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{os_ver}/x86_64/puppet-bolt-#{version}-1.osx#{os_ver}.dmg"
  pkg "puppet-bolt-#{version}-1-installer.pkg"

  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
