cask 'puppet-agent-7' do
  if MacOS.version < :catalina
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '10.15'
    os_ver = '10.15'
    version '7.18.0'
    sha256 'be54e95d765fec76a7f38b1586388845abbcc061640d3c9f5afc9ef3981af599'
  when '11'
    os_ver = '11'
    version '7.18.0'
    if arch == 'arm64'
      sha256 '3edd5579407501dcb4321107cb7eafdad1bcf8d4cdceb37980ebc01dcb96218a'
    elsif arch == 'x86_64'
      sha256 'aa1059aa51ef979b4d47104430afe65f715afb3e496bdc933a2d16d5c20a8fbe'
    end
  else
    os_ver = '12'
    version '7.18.0'
    if arch == 'arm64'
      sha256 'eec2447eab9648c0ebacaaaad3ad21efecaf6a720aa46ea1f57b0cbe1ea842fb'
    elsif arch == 'x86_64'
      sha256 'dd5c3a608793d2e8bb8046357ee4908960afda987e467b6088799594ec2df247'
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
