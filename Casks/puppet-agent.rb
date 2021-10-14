cask 'puppet-agent' do
  case MacOS.version
  when '10.14'
    os_ver = '10.14'
    version '7.9.0'
    sha256 '539f2cbacf20bd2bed3bd7f173dc07aa99d9305a8cb91408e450e8b39ba0177d'
  when '10.15'
    os_ver = '10.15'
    version '7.12.0'
    sha256 '14da62b94beda2578fdd9e0c54d566c5f59ae882351ad1565fab2613ea42e040'
  else
    os_ver = '11'
    version '7.12.0'
    sha256 '7e2306b51c4f7d7f64f2d8485a1cf5c0f2afa2ea2064b50b8cf0596c0165f55a'
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
