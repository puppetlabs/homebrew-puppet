cask 'puppet-agent-6' do
  case MacOS.version
  when '10.12'
    os_ver = '10.12'
    version '6.8.1'
    sha256 '5202dba3db8d8011b47ffe35283bfc14ee6dc3d767faa92112564d07ddc44efc'
  when '10.13'
    os_ver = '10.13'
    version '6.8.1'
    sha256 '90d6b2ea0707970aeac6e880891e77019e66f65e8834c8a449a63d233bf2689c'
  else
    os_ver = '10.14'
    version '6.8.1'
    sha256 '984eb8ab9a58d2b57223d5914f7749b0a23bb6893d08e62349ec5717c10b2756'
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
