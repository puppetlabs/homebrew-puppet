cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.6.0'
    sha256 'b7b1e690be0c7611f642b597eb06ae832069a04b890943f88901a02a4b93f338'
  when '10.12'
    os_ver = '10.12'
    version '1.6.0'
    sha256 '63fd00a618e186d90e4de419e8cffa2ba16bb227df16b112dafcc99d2fc2ab90'
  else
    os_ver = '10.13'
    version '1.6.0'
    sha256 '97a42d381086b75e38daa4f8ba351ad974090dd93a081ddf219aabdd04046b01'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{os_ver}/x86_64/puppet-bolt-#{version}-1.osx#{os_ver}.dmg"
  pkg "puppet-bolt-#{version}-1-installer.pkg"

  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
