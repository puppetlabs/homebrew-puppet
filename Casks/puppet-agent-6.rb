cask 'puppet-agent-6' do
  case MacOS.version
  when '10.12'
    os_ver = '10.12'
    version '6.4.0'
    sha256 'e21e90e8cba67021bd2323e2208555eb5db8260419c70996d7010653c3c43080'
  when '10.13'
    os_ver = '10.13'
    version '6.4.0'
    sha256 'c05e07c77174a18ea330434bb2c74dbbf51387b9e7cc09b8c97e63681323999b'
  else
    os_ver = '10.14'
    version '6.4.0'
    sha256 '604fd125f501ad3dd1472e56fa5a76b4f490484f8be484dd779fe40349f38e77'
  end

  depends_on macos: '>= 10.12'
  url "https://downloads.puppet.com/mac/puppet6/#{os_ver}/x86_64/puppet-agent-#{version}-1.osx#{os_ver}.dmg"
  pkg "puppet-agent-#{version}-1-installer.pkg"

  name 'Puppet Agent'
  homepage "https://puppet.com/docs/puppet/#{version.major_minor}/about_agent.html"

  uninstall launchctl: [
                         'puppet',
                         'pxp-agent',
                       ],
            pkgutil:   'com.puppetlabs.puppet-agent'

  zap trash: [
               '~/.puppetlabs',
               '/etc/puppetlabs',
             ]
end
