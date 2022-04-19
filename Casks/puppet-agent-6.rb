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
    version '6.27.1'
    sha256 '72a0cfe227d1e8a9dbf0fdde0a289f37af8418901b21e69a9f3baffd6a714c21'
  when '11'
    os_ver = '11'
    version '6.27.1'
    sha256 'b7eb95b7bf15ae3cc9fcecaa8a87446641130f4507c575525310f4ca13b31e58'
  else
    os_ver = '12'
    version '6.27.1'
    sha256 '96a39dc55fb54fecbaefcbce119313578d1b34a5b7edf683d9bd7ed188461a73'
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
