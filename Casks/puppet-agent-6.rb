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
    version '6.28.0'
    sha256 '88597e18dff9c738f0a3d5affab54b32e25a39bb171cee3622e49dd9da32b45c'
  when '11'
    os_ver = '11'
    version '6.28.0'
    sha256 '2e2eaa07b8b1be952e6c19f64ca4a25870e3e3ceca7fe0547fdc7039684049ae'
  else
    os_ver = '12'
    version '6.28.0'
    sha256 '09be98465a129ef0657968f8e7efae095c2979506961a60bd8a46144a169036d'
  end

  if MacOS.version < :catalina
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  depends_on macos: '>= :sierra'
  url "https://downloads.puppet.com/mac/puppet6/#{os_ver}/#{arch}/puppet-agent-#{version}-1.osx#{os_ver}.dmg"
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
