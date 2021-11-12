cask 'puppet-agent-6' do
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
    version '6.24.0'
    sha256 '8b9a7634fcbc9771f3497d448da073273fb4be1a9a2c82fe79f3a99e53e6f4bb'
  when '10.15'
    os_ver = '10.15'
    version '6.25.1'
    sha256 'b53b546cf77732d86e660a2c4bcb35916342e7284fc8c465ec00dd310a549198'
  else
    os_ver = '11'
    version '6.25.1'
    sha256 'c469da74043cdfce111ace8b7f6f8c49dc5bfcb0917229053432a349aa105a84'
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
