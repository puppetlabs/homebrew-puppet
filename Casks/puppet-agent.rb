cask 'puppet-agent' do
  case MacOS.version
  when '10.12'
    os_ver = '10.12'
    version '6.3.0'
    sha256 'cfb9b365a5b1b0a67c0ae62079b2d91b757e451f3633b45f59ae0e8900fee3e3'
  when '10.13'
    os_ver = '10.13'
    version '6.3.0'
    sha256 '1b213d080ee2156d0e5ceb7bdf83b8917ac29691af6d0bfc0a5da889ddf209fc'
  else
    os_ver = '10.14'
    version '6.3.0'
    sha256 'b8ffdb76613adac062dea5be6ccfab8d310fd4c203396a28614f6c62f56f4deb'
  end

  depends_on macos: '>= 10.12'
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
