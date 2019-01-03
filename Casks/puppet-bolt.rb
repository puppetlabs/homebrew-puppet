cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.8.0'
    sha256 'f52f49e950bde16e120c982571dc5d79c639791dfff75061088de52f61efa18d'
  when '10.12'
    os_ver = '10.12'
    version '1.8.0'
    sha256 'eda0851b00c124bb7c1cc47b9f8d8e7e64d0df22bb5a7cdb5c3d5e7c378b89c6'
  else
    os_ver = '10.13'
    version '1.8.0'
    sha256 '02b0c9b0e6ffd599e6f67bedf9272f2b0e62d182a05b539b6f90db4c46d7e5d0'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{os_ver}/x86_64/puppet-bolt-#{version}-1.osx#{os_ver}.dmg"
  pkg "puppet-bolt-#{version}-1-installer.pkg"

  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
