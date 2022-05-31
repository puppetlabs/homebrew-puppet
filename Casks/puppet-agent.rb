cask 'puppet-agent' do
  case MacOS.version
  when '10.14'
    os_ver = '10.14'
    version '7.9.0'
    sha256 '539f2cbacf20bd2bed3bd7f173dc07aa99d9305a8cb91408e450e8b39ba0177d'
  when '10.15'
    os_ver = '10.15'
    version '7.17.0'
    sha256 '8c4eff08e57dd12d6e45d1a7ab95980e147321d4c4421208d8dd90450e62e0f0'
  when '11'
    os_ver = '11'
    version '7.17.0'
    sha256 'c701d2b0eb30614e27ad5358e50537544bf625864fe695963a70260878e7705e'
  else
    os_ver = '12'
    version '7.17.0'
    sha256 '3854ced5b4c0315a691bddf666165178f1a164d088c2ffcbe3af108ef8fb04b3'
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
