cask 'puppet-agent-7' do
  if MacOS.version < :catalina
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '10.15'
    os_ver = '10.15'
    version '7.23.0'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 'f4af2bf66b6fbbe9931fda40ea2cf813131eaa543156a7123738d8bb4ac19fd5'
    end
  when '11'
    os_ver = '11'
    version '7.23.0'
    if arch == 'arm64'
      sha256 '6bf85e2ef46f3384fbda6e50799a1010796c2d5c365da670f2368599507d7b46'
    elsif arch == 'x86_64'
      sha256 'da16afefcfbee0f03e3773aa7e06a29b91fbe059ba6520ecee339adb4c48d9b5'
    end
  else
    os_ver = '12'
    version '7.23.0'
    if arch == 'x86_64'
      sha256 '27163b7ca4767b9bcbdc5ee8c9bacd7e9fd15ef082cec17f58fef7a09c5cc619'
    elsif arch == 'arm64'
      sha256 'c994c1c438f2fa34b99c08fe38ef8373aa4c152f12838de5fc9a6090b69708da'
    end
  end

  depends_on macos: '>= :catalina'
  url "https://downloads.puppet.com/mac/puppet7/#{os_ver}/#{arch}/puppet-agent-#{version}-1.osx#{os_ver}.dmg"
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
