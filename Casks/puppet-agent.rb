cask 'puppet-agent' do
  case MacOS.version
  when '10.14'
    os_ver = '10.14'
    version '7.4.0'
    sha256 'e1de5f0b6074953ce6792d827f0422b76de91947f00d2a75440c2294c8367996'
  else
    os_ver = '10.15'
    version '7.4.0'
    sha256 '9423f01af38260b6de8bdcc0b7970f33e1e87ac1ec1dbc8d1b8853355cea5d32'
  end

  depends_on macos: '>= :mojave'
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
