cask 'puppet-agent-7' do
  if MacOS.version < :catalina
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '11'
    os_ver = '11'
    version '7.34.0'
    if arch == 'arm64'
      sha256 '54c880828b6ffee0c3f713bff6d87e391ffb00a6efd09acbdcf4e2995b548194'
    elsif arch == 'x86_64'
      sha256 '57514cc255266c574adf3f37adb089eec6666ca9e6938178f1cd52594a7d9bc9'
    end
  when '12'
    os_ver = '12'
    version '7.34.0'
    if arch == 'arm64'
      sha256 '4803356d7047d9ddb3f1b1a22994df213e2e532a5dbff8a6d017c22e2b2df633'
    elsif arch == 'x86_64'
      sha256 'a450b3e150476f6ebaef1aada99ad00f3da471c34b35bcdae28dfbe3c43683f0'
    end
  when '13'
    os_ver = '13'
    version '7.34.0'
    if arch == 'arm64'
      sha256 '4cc717dfd33f4edc946d25045eff8bfe4cc5e022202af155d52ba214bb2bbec0'
    elsif arch == 'x86_64'
      sha256 'd571164ebd42b824e0018af0a9cf6222aebce20952c50e98de407b2da24201d0'
    end
  else
    os_ver = '14'
    version '7.34.0'
    if arch == 'x86_64'
      sha256 'cf75f75482f37367ef9dd5b4ae1283b81201dfde1e439d3791a10b13bcb3330a'
    elsif arch == 'arm64'
      sha256 'c271736fa3d8a0d7238667a4fbf16e08ff3b657722ec6a793e82badd3f14f469'
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
