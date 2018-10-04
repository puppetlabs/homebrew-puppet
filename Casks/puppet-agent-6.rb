cask 'puppet-agent-6' do
  case MacOS.version
  when '10.12'
    version '6.0.2'
    sha256 '5c76c20f321773f0d96bb6cf101606faa662a5f59d7ea6f766040ae4089ec7a2'
  when '10.13'
    version '6.0.2'
    sha256 '42b0af1c55089c2afcfc1fc64e6617cb3ebcd26d9ea19cf0aee78cb609eba99f'
  end

  depends_on macos: '>= 10.12'
  url "https://downloads.puppet.com/mac/puppet6/#{MacOS.version}/x86_64/puppet-agent-#{version}-1.osx#{MacOS.version}.dmg"
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
