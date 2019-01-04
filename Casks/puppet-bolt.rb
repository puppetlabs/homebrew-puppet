cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.8.1'
    sha256 '27f745009493b4052968669529150dee6aa4bec24b383661fb52c28593e97426'
  when '10.12'
    os_ver = '10.12'
    version '1.8.1'
    sha256 'df86a002599f0daaecdbfa28cd60ceec2d788f1a381623ab532232dd6d8a3549'
  else
    os_ver = '10.13'
    version '1.8.1'
    sha256 '462630d1a45e39ece35e9437df3dc00612f0e58ecf7fccac52d1a005af935a79'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{os_ver}/x86_64/puppet-bolt-#{version}-1.osx#{os_ver}.dmg"
  pkg "puppet-bolt-#{version}-1-installer.pkg"

  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
