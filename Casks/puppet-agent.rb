cask 'puppet-agent' do
  case MacOS.version
  when '10.12'
    os_ver = '10.12'
    version '6.13.0'
    sha256 '3577c3656b40014a97a409423db6b70dca80accab550b7966ecc0dd5c4fa9007'
  when '10.13'
    os_ver = '10.13'
    version '6.13.0'
    sha256 '2e4f6a316b633200fd2a9c0a0b57e3dea785c9f9c19e07ad4e295cdd00914b10'
  when '10.14'
    os_ver = '10.14'
    version '6.18.0'
    sha256 '9dedb6507e94ce2f31fa198f2f280f106d1f6023a5604a6ebb7384d33444b63b'
  else
    os_ver = '10.15'
    version '6.18.0'
    sha256 '9bc0aeffac8d6fcf42d5b1e9c49a2d269c096dcb3c8304012bbefe137e9d785d'
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
