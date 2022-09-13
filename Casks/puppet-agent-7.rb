cask 'puppet-agent-7' do
  if MacOS.version < :catalina
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '10.15'
    os_ver = '10.15'
    version '7.19.0'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 '9552bee4d6f7cf51e59f2b69849c6f96f9d7f95d236b5505e95bf35279bef0a3'
    end
  when '11'
    os_ver = '11'
    version '7.19.0'
    if arch == 'arm64'
      sha256 '90d78077865907db22348d4960be55044af8c1f2dcb7c51e489001fe50f83c55'
    elsif arch == 'x86_64'
      sha256 'ce714cb81a8c3b6e667d4751900355cab29fddd6066f4798b39049d4c8c0557e'
    end
  else
    os_ver = '12'
    version '7.19.0'
    if arch == 'x86_64'
      sha256 '5f6fe6b2b3b3126f6784ad2dc1b492d40e90d8c4c072ef83cb8179bc90a44822'
    elsif arch == 'arm64'
      sha256 '9f6fa970139e7ba32fce624001004233d4518532024f1ea7aae55ac7a21f2f3c'
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
