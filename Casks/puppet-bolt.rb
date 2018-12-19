cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.7.0'
    sha256 'ee8abc5c5cf9c50da0b364e976b652f8023a263ef41dc31c08dabbc7c4fcc953'
  when '10.12'
    os_ver = '10.12'
    version '1.7.0'
    sha256 '865715b737634b1b84d8503dd27d8a57bf776e619246c99fccc2b2f697bbaac0'
  else
    os_ver = '10.13'
    version '1.7.0'
    sha256 '8ad227ab583592e840cb81179ce0920e53c7c15fc065cca34a7b31bce143f389'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{os_ver}/x86_64/puppet-bolt-#{version}-1.osx#{os_ver}.dmg"
  pkg "puppet-bolt-#{version}-1-installer.pkg"

  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
