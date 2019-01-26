cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.10.0'
    sha256 'd80ec499c0a550df7bfc57f8b9aedae3940b96b1cbcc371a6c6b5afef2d65ce7'
  when '10.12'
    os_ver = '10.12'
    version '1.10.0'
    sha256 '36f232a922106733e0a3fdcb39424f165560638ac9e26a2b38e5d17d172d727b'
  else
    os_ver = '10.13'
    version '1.10.0'
    sha256 '4bed299ca41ea0fa1ad4984941445f70c2c9cfd3919082ab27cd6d1bc732d479'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{os_ver}/x86_64/puppet-bolt-#{version}-1.osx#{os_ver}.dmg"
  pkg "puppet-bolt-#{version}-1-installer.pkg"

  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  caveats do
    path_environment_variable '/opt/puppetlabs/bolt/bin'
  end

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
