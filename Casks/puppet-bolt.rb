cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.1.0'
    sha256 'ef7dc6bb7a4a6e141634441f252b591826a96d9821a5af0493b25c86c502d45a'
  when '10.12'
    os_ver = '10.12'
    version '1.1.0'
    sha256 '66638b6c26bae92a1e4851487e4ee8588d6ffc9f6a242ec35ee558bb8f88b6ec'
  else
    os_ver = '10.13'
    version '1.1.0'
    sha256 'bf416f19873c38af92089669045636d7f2697eb41762c1b925bd2acd78ee9a6a'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{os_ver}/x86_64/puppet-bolt-#{version}-1.osx#{os_ver}.dmg"
  pkg "puppet-bolt-#{version}-1-installer.pkg"

  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
