cask 'puppet-agent' do
  case MacOS.version
  when '10.14'
    os_ver = '10.14'
    version '7.4.1'
    sha256 'fe871ff1548e8a9a1d8f4e462113217477a16b64e167179d452a406c02cfbaae'
  else
    os_ver = '10.15'
    version '7.4.1'
    sha256 '7ea75ff49dd9bf911fa1e41080166644860f0437c4299ae0194b2d3fb47d62a5'
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
