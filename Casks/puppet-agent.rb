cask 'puppet-agent' do
  case MacOS.version
  when '10.14'
    os_ver = '10.14'
    version '7.1.0'
    sha256 'f74658807704c29edf940be65ba02b85c8e6320fb2399d7320f9f4a73705eb49'
  else
    os_ver = '10.15'
    version '7.1.0'
    sha256 'f0635cc7cb1db4f42b4f1a0ec6279c1edbab3c8e7fb85084bed76947f50366eb'
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
