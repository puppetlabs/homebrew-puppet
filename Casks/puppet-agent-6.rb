cask 'puppet-agent-6' do
  case MacOS.version
  when '10.12'
    os_ver = '10.12'
    version '6.0.4'
    sha256 '91e1b0289f6113b30de37390f435e49d4155ef166a2520556926d91323a6ddc1'
  else
    os_ver = '10.13'
    version '6.0.4'
    sha256 '1636f352a8ab19907e251a685358a964642c1291b9046786838667ff1f0d0ea4'
  end

  depends_on macos: '>= 10.12'
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
