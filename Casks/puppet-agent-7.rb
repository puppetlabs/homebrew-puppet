cask 'puppet-agent-7' do
  case MacOS.version
  when '10.14'
    os_ver = '10.14'
    version '7.9.0'
    sha256 '539f2cbacf20bd2bed3bd7f173dc07aa99d9305a8cb91408e450e8b39ba0177d'
  when '10.15'
    os_ver = '10.15'
    version '7.9.0'
    sha256 '43fd14a21de0358555065cc86210c45df43ddcc5c27d083f4e11d9706c49d4c8'
  else
    os_ver = '11'
    version '7.9.0'
    sha256 '9686d89d73f2a7373bfb3360e98a6c0bdcf8d793a35d8b96192684ec07f83370'
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
