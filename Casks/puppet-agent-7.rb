cask 'puppet-agent-7' do
  case MacOS.version
  when '10.14'
    os_ver = '10.14'
    version '7.9.0'
    sha256 '539f2cbacf20bd2bed3bd7f173dc07aa99d9305a8cb91408e450e8b39ba0177d'
  when '10.15'
    os_ver = '10.15'
    version '7.12.1'
    sha256 '36e7d4a91f6cc8d71d3bfa295000e6feea846e21fffd620f2b3f324b3a1037e7'
  else
    os_ver = '11'
    version '7.12.1'
    sha256 'bdd9a969b6856cd96bc35f832c8b918805ade3e41e9175b488ffda86ebe56c3f'
  end

  depends_on macos: '>= :mojave'
  url "https://downloads.puppet.com/mac/puppet7/#{os_ver}/x86_64/puppet-agent-#{version}-1.osx#{os_ver}.dmg"
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
