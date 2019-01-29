cask 'puppet-agent' do
  case MacOS.version
  when '10.12'
    os_ver = '10.12'
    version '6.2.0'
    sha256 'fc5127ca4d85eb2f3784a7f3d9a75316c27ca6734e2065c147b6ff33945657ef'
  else
    os_ver = '10.13'
    version '6.2.0'
    sha256 'e6b54e00495cfb0876af3189388d19284c48b146f4b1c9180040f161c24e7b42'
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
