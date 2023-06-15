cask 'puppet-agent' do
  if MacOS.version < :catalina
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '11'
    os_ver = '11'
    version '7.25.0'
    if arch == 'arm64'
      sha256 'e3b24be25b08726074fb3d76abfbe59291b383ce874da6af0c2f80da66b1bac6'
    elsif arch == 'x86_64'
      sha256 '257ce39fc5d761873e61efedaf655ffc4c8e7f86642481387ee1af662bb03741'
    end
  else
    os_ver = '12'
    version '7.25.0'
    if arch == 'x86_64'
      sha256 'b2bfd5581bfc1c5412d17dcd7b5e2d307f9d4d55e63a0a72cb11a657885009c0'
    elsif arch == 'arm64'
      sha256 '8cb860ecdb2f7222088146769a47f0b2dc3d3176a836e3011239221511b8d71f'
    end
  end

  depends_on macos: '>= :catalina'
  url "https://downloads.puppet.com/mac/puppet/#{os_ver}/#{arch}/puppet-agent-#{version}-1.osx#{os_ver}.dmg"
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
