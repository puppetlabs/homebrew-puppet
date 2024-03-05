cask 'puppet-agent-8' do
  if MacOS.version < :monterey
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '11'
    os_ver = '11'
    version '8.5.1'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 '6260f20023f61f6ff657675a89d81b6277524b33131cb2e0a65a94312a1b75fb'
    end
  when '12'
    os_ver = '12'
    version '8.5.1'
    if arch == 'arm64'
      sha256 '9f3001d454db68a0abc8f99afbf13bcf0ae08ceca7b11dc9ab962e8be3d26c60'
    elsif arch == 'x86_64'
      sha256 'd8c30df2007d1de339b140fca8518aed8a3cf658689fbd163f459933d396dc20'
    end
  when '13'
    os_ver = '13'
    version '8.5.1'
    if arch == 'arm64'
      sha256 'd0a1d6dac3be58ffe51e194c8d858f6f67cc6e71866b993c9a921dfca3b1cb0f'
    elsif arch == 'x86_64'
      sha256 '8b49643f70c2deb9fa4ab264fe0a0293146685563bdb3e970a27b2cb5d4adf5d'
    end
  else
    os_ver = '14'
    version '8.5.1'
    if arch == 'x86_64'
      sha256 'c640927de35a9238fe01b8ca8480d904dce2c0a532bc7bdbfe0c85f5afc8c42d'
    elsif arch == 'arm64'
      sha256 '5485e47e04b5575151da1e8992cc050e4e8d27a97cb564aae73fd3392ba2b006'
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
