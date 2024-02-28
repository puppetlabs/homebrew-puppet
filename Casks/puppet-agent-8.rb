cask 'puppet-agent-8' do
  if MacOS.version < :monterey
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '11'
    os_ver = '11'
    version '8.5.0'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 'a5fd8647813e93d4907bacf37d9b33fc4df719509bf6a7d4fb0dd979828887f8'
    end
  when '12'
    os_ver = '12'
    version '8.5.0'
    if arch == 'arm64'
      sha256 '547ec7896558a9b9ae26a861ecda1d144c9f7a8d76f4cdab2fa780579b1c80a0'
    elsif arch == 'x86_64'
      sha256 'cf7815fbc4089761d693655b00ce6dd2bfb1f238a8f355881bb40acbcce3163c'
    end
  when '13'
    os_ver = '13'
    version '8.5.0'
    if arch == 'arm64'
      sha256 '0f38367beb86c0dd7bbe00f20da85d367a4ad148235ba5368364c205fd140c03'
    elsif arch == 'x86_64'
      sha256 '418f997d35f894464e657f3aeb3ece39aa7e8190fc44399c435716698af0c4ed'
    end
  else
    os_ver = '14'
    version '8.5.0'
    if arch == 'x86_64'
      sha256 '3085d86307044feea61fa1712d9d1b687c7995a94a347d5511e1146e94f12026'
    elsif arch == 'arm64'
      sha256 'b09b236d2ab21d31b5aeef21abc1e5f7807c7d271067285d7a090f349d4d51dd'
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
