cask 'puppet-agent-7' do
  if MacOS.version < :catalina
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '11'
    os_ver = '11'
    version '7.27.0'
    if arch == 'arm64'
      sha256 '045fd264ddf693d73c7afc8046f97e352ced68bacd9fb30c28b52b6e7126cfcf'
    elsif arch == 'x86_64'
      sha256 '476b564300729665ca76cf7b6ea121bace7767a1df0dd92f161eeef02ee35e80'
    end
  when '12'
    os_ver = '12'
    version '7.27.0'
    if arch == 'arm64'
      sha256 '2e21925b814459107b166da8ed81aa306494a1bfa3e536af22648b594cb07046'
    elsif arch == 'x86_64'
      sha256 '10b6ef2d3d3a179e22bbf60243121711ba21fb857863c62a4f461a318797b368'
    end
  else
    os_ver = '13'
    version '7.27.0'
    if arch == 'x86_64'
      sha256 '4baf22cc79602ede4ada8356c5119de541fabd6d6f615e3ca6d7dbac7e9c99bc'
    elsif arch == 'arm64'
      sha256 'bd0b91be51f1348dc67e1d3c680b2bc42c3c53544092e383a2620c183ee79a7e'
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
