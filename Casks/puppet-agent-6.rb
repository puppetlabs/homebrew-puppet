cask 'puppet-agent-6' do
  case MacOS.version
  when '10.12'
    os_ver = '10.12'
    version '6.11.1'
    sha256 '7ee602f947eedffbdf440f01872aface8f279df4df6cba3e84fa4248bc7e0efc'
  when '10.13'
    os_ver = '10.13'
    version '6.11.1'
    sha256 '61e7cfb4dcb74a67ef0671de0de785285c64c66004966721f528bf6379ee289c'
  else
    os_ver = '10.14'
    version '6.11.1'
    sha256 '69bd0c5a2e757f4e4762c1c0d91c2f8099d8865cc2165a1de2b01595272af2ee'
  end

  depends_on macos: '>= :sierra'
  url "https://downloads.puppet.com/mac/puppet6/#{os_ver}/x86_64/puppet-agent-#{version}-1.osx#{os_ver}.dmg"
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
