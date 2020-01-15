cask 'puppet-agent' do
  case MacOS.version
  when '10.12'
    os_ver = '10.12'
    version '6.12.0'
    sha256 'b9d6c9a9481c0fa90c7a40624b9a60763e5fd88abf0b6800e5af1d5e3b46ca3e'
  when '10.13'
    os_ver = '10.13'
    version '6.12.0'
    sha256 'b8264213ba37295193691402eb2fcd21060c4124b81e8756204145bd4f20b5e5'
  else
    os_ver = '10.14'
    version '6.12.0'
    sha256 '9d04991ca456c584c4fcf4255a575812a6a6dc2add390a451ac848580d9e0b70'
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
