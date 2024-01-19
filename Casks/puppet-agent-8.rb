cask 'puppet-agent-8' do
  if MacOS.version < :monterey
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '11'
    os_ver = '11'
    version '8.4.0'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 '3d75ce59b099eb91f70a7a1f73c2d4073301dd70ac260271007d4215449a46d9'
    end
  when '12'
    os_ver = '12'
    version '8.4.0'
    if arch == 'arm64'
      sha256 '0b4016b0fbbc8c83d475b2a5a08e37729e12fc66958b7d90fd484448fa967aa7'
    elsif arch == 'x86_64'
      sha256 '9cd599deeecb022a03c5ce38fc23666a7f53596ef4476a41568925ebfe7aca02'
    end
  when '13'
    os_ver = '13'
    version '8.4.0'
    if arch == 'arm64'
      sha256 '0885c0f4497c4ec5c7ec3585d217a7271df066e53424f48965501c94d6ccd92f'
    elsif arch == 'x86_64'
      sha256 '26b172431ca8d14535856995901633159eb8bb6e8901ea32c71356b050d4dd95'
    end
  else
    os_ver = '14'
    version '8.4.0'
    if arch == 'x86_64'
      sha256 '987aa715ad427f4b8e40c198281c890d95239d3cfd00050d9334a861f43c4322'
    elsif arch == 'arm64'
      sha256 'da84c7a965b7fdd28cbf921fe7162d406f73f78de462f7a5c2aef5db5e3616ad'
    end
  end

  depends_on macos: '>= :big_sur'
  url "https://downloads.puppet.com/mac/puppet8/#{os_ver}/#{arch}/puppet-agent-#{version}-1.osx#{os_ver}.dmg"
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
