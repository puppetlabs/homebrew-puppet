cask 'puppet-agent-8' do
  if MacOS.version < :monterey
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '11'
    os_ver = '11'
    version '8.8.1'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 '8a50a504f3444e28f8ad3d28239930490116a8fb1721fd08ee82892251b71bff'
    end
  when '12'
    os_ver = '12'
    version '8.8.1'
    if arch == 'arm64'
      sha256 'd19f1a2b6750130b90a8b40fd654d8a9dfaee73c508481839d10b21ed1a99295'
    elsif arch == 'x86_64'
      sha256 'cbf822152c7953e031e6a746ea4454d298c16798cd8d5bcbfdefefbbf9b05dd9'
    end
  when '13'
    os_ver = '13'
    version '8.8.1'
    if arch == 'arm64'
      sha256 '911b786fd0862acd2ecd1324b91dcbd4480f71fa38427f3c35500f3450c7977f'
    elsif arch == 'x86_64'
      sha256 '220d539e886a49ea41531c2e7cca8e3c2a9ade612dbd243bee5f9e0e4dfb500f'
    end
  else
    os_ver = '14'
    version '8.8.1'
    if arch == 'x86_64'
      sha256 '035bd7bb403772ed815ba8b16ab2148815d4143b836a01ec088fe28c6c06d101'
    elsif arch == 'arm64'
      sha256 '3441ea328d2b6c6001fb813ca35cca17830a30e607cfa9026a2a30a5e36e4ced'
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
