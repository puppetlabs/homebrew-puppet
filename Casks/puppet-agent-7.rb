cask 'puppet-agent-7' do
  case MacOS.version
  when '10.14'
    os_ver = '10.14'
    version '7.9.0'
    sha256 '539f2cbacf20bd2bed3bd7f173dc07aa99d9305a8cb91408e450e8b39ba0177d'
  when '10.15'
    os_ver = '10.15'
    version '7.16.0'
    sha256 '32bf486e1398c94e044ffe8226b8caad2129439bd23a10a1fbad4242e7a5e811'
  when '11'
    os_ver = '11'
    version '7.16.0'
    sha256 '8df68237dd4204d332118a962802825eed95bd85111d2ff1fa09fc90e2f03dd4'
  else
    os_ver = '12'
    version '7.16.0'
    sha256 '4a7563b092644156d7216b49b87c8518e4c79a540536e0d9953e462be54456f5'
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
