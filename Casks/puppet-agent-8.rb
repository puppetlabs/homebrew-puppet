cask 'puppet-agent-8' do
  if MacOS.version < :monterey
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '11'
    os_ver = '11'
    version '8.7.0'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 'd1243a0c4cf360e7f84048163599878339ffd63cbd27a5ec8cbc6912258fdd59'
    end
  when '12'
    os_ver = '12'
    version '8.7.0'
    if arch == 'arm64'
      sha256 'f001c4f794da5f4a983f90bf1ff9560abf7e6c82f2c8ad5b7bcfdff682781476'
    elsif arch == 'x86_64'
      sha256 'cce23d66942d52ffc7279fccb85b536dce2888bb836204c1ae33c4c10cfd257d'
    end
  when '13'
    os_ver = '13'
    version '8.7.0'
    if arch == 'arm64'
      sha256 '5bcd7672431c5f0f234714407d7bd9a8b2296dd98e35aa30ae227c77592d1e18'
    elsif arch == 'x86_64'
      sha256 '773cd3243e2cd82611f71b4f57dca8040eed4d496bdf293af204bf7aff42b7b6'
    end
  else
    os_ver = '14'
    version '8.7.0'
    if arch == 'x86_64'
      sha256 '4b3a0bce1ba33f00570d168f29e530f378de9f0c644cef89093b58f974c48711'
    elsif arch == 'arm64'
      sha256 '447299a15cfc0b0c63e75e48c2c8e3385002f5a2a72e71a7078fa5e9d0eb6dfd'
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
