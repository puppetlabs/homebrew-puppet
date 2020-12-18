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
    version '6.19.1'
    sha256 '7250f4f1be20346cfe7bd07c6dd4ea2c3dfae087e4567d80ae85a41898eb2bce'
  else
    os_ver = '10.15'
    version '6.19.1'
    sha256 'd53ed2ae58699fd03ad8a7a43ca09193b6e1d2b43ea601f9f202f37d7f3a608a'
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
