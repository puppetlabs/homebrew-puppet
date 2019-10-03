cask 'puppet-agent-6' do
  case MacOS.version
  when '10.12'
    os_ver = '10.12'
    version '6.10.0'
    sha256 'dc4c66294360f34f2f206ddd3b521525f8212af9988ddaf6332e93bc1ee72d5e'
  when '10.13'
    os_ver = '10.13'
    version '6.10.0'
    sha256 '28b09a844a3011144ca41b79061c24c5286991f3ded35dd674bfdb52b0b199dd'
  else
    os_ver = '10.14'
    version '6.10.0'
    sha256 'afbd7fd0c8ac2c13494892001fa2fdc7aab1761bb0031e58da321a1f8b0156d3'
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
