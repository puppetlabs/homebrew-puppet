cask 'puppet-agent-7' do
  if MacOS.version < :catalina
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '11'
    os_ver = '11'
    version '7.28.0'
    if arch == 'arm64'
      sha256 '6439d894fee40248b95824cf11a9b09c2eb1add2e6193481eed0c3baeb2c4147'
    elsif arch == 'x86_64'
      sha256 'c5265b1cf9c327ff5485cff8bb2e58e1ce2fd1501aab465ddf39d9eec209d7bc'
    end
  when '12'
    os_ver = '12'
    version '7.28.0'
    if arch == 'arm64'
      sha256 '495fb6acba73373558a8d4b960e6350b7354af06bef6ecda820f96c22341a838'
    elsif arch == 'x86_64'
      sha256 '6ce3f3c4261091111381635ca6c1dc9f16318f405ae12ee0efdde97ccfa21c8f'
    end
  when '13'
    os_ver = '13'
    version '7.28.0'
    if arch == 'arm64'
      sha256 '6075443057cdb4bfeb98503c81d3919606c25812eb4c70d9b95d996ab10f7493'
    elsif arch == 'x86_64'
      sha256 'e73260632e346e00028bb2f26c2923eef71c09037567a887cdfabde1674f3762'
    end
  else
    os_ver = '14'
    version '7.28.0'
    if arch == 'x86_64'
      sha256 'b626e1cd470232fddad663aae564a8152dcbe2a953c42293e6bd10c6c561c599'
    elsif arch == 'arm64'
      sha256 '24a04d1a3fc99829de6c9c1bc41350c5491a21e7e6b56e58b9043ba6aeaf42de'
    end
  end

  depends_on macos: '>= :big_sur'
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
