cask 'puppet-agent-7' do
  if MacOS.version < :catalina
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '10.15'
    os_ver = '10.15'
    version '7.20.0'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 '46fc99686e2918070ca09a911776f528ba803c532f9e4ed185c9efc091f5b27b'
    end
  when '11'
    os_ver = '11'
    version '7.20.0'
    if arch == 'arm64'
      sha256 '665df11b1cc1d1c474f990263f6bc12978c8d19301018905a4a22a10497b6ab8'
    elsif arch == 'x86_64'
      sha256 'f4135e07f337dc3366fe7cd891b1c61da52876927bda163905433659df487332'
    end
  else
    os_ver = '12'
    version '7.20.0'
    if arch == 'x86_64'
      sha256 '24c7fbda0bde5a6780ede43f3818b5bed4c1295b497b8c93f18e0c38b645b570'
    elsif arch == 'arm64'
      sha256 'a9c575bb05b7b3823dad10d0a2b99c0896aaef0dcdd7f08cca118a7d9d07a6f7'
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
