cask 'puppet-agent' do
  case MacOS.version
  when '10.12'
    os_ver = '10.12'
    version '6.1.0'
    sha256 '2086b079cc5bacd0d07359ee276793c29b80cf9840d6e0332ccadc40bafaa05b'
  else
    os_ver = '10.13'
    version '6.1.0'
    sha256 '56bb8d7ab09acabe010c86d7ba914cd8a8ed442315317babeface7c0a32015d9'
  end

  depends_on macos: '>= 10.12'
  url "https://downloads.puppet.com/mac/puppet/#{os_ver}/x86_64/puppet-agent-#{version}-1.osx#{os_ver}.dmg"
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
