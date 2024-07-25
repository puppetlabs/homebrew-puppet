cask 'puppet-agent-7' do
  if MacOS.version < :catalina
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '11'
    os_ver = '11'
    version '7.32.1'
    if arch == 'arm64'
      sha256 '1f5be733a8dde3046108715c30a292651a5078a54efe09f26560e5fa360ad022'
    elsif arch == 'x86_64'
      sha256 '6c72374b3ed6a7990a8247357b44f6f2e89f2a46bb80dc234fd72e6cc0916624'
    end
  when '12'
    os_ver = '12'
    version '7.32.1'
    if arch == 'arm64'
      sha256 'aedc656dd8f7889f23f7d1db6d4ec1b64f74ec261fe49dbb655a3f077571cd6b'
    elsif arch == 'x86_64'
      sha256 'c374473bd03667b6d29c5e4987ef8cbc51ac1e9d4547eaa17489accd1ed3c48c'
    end
  when '13'
    os_ver = '13'
    version '7.32.1'
    if arch == 'arm64'
      sha256 '0fc5a22adbbfa79848f7f42e4e6d96c9fef426568e511a353dd38108b52a6cbe'
    elsif arch == 'x86_64'
      sha256 'e5d4879c1d1b272a37d38a932536a7f4968a46169cff12d37dff61f6e6533870'
    end
  else
    os_ver = '14'
    version '7.32.1'
    if arch == 'x86_64'
      sha256 'aa90b3ed64299600b07f610e3fbe084e5080b5671264f4e3eb366cccc71911cb'
    elsif arch == 'arm64'
      sha256 '697d0081e87bf73219922c46f51c108ee13623bcdbd9d2dd6aca50f305f50c91'
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
