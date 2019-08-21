cask 'puppet-agent' do
  case MacOS.version
  when '10.12'
    os_ver = '10.12'
    version '6.8.0'
    sha256 '8048a498da71086604c3b8de14faf076a00364708fd9a85954acb26054d6148d'
  when '10.13'
    os_ver = '10.13'
    version '6.8.0'
    sha256 '90913ed0fadcff05b036fb6b31674ef2d2344fcf6f72b27659643d85eb8e3c64'
  else
    os_ver = '10.14'
    version '6.8.0'
    sha256 '8ff0f93298210520162874caf7c1101cbb65b685e1605ce032208bb50f381dcc'
  end

  depends_on macos: '>= :sierra'
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
