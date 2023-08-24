cask 'puppet-agent-8' do
  if MacOS.version < :monterey
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '11'
    os_ver = '11'
    version '8.2.0'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 '82fea415c6104f93b55f78d0f778fbeca63e0f2e2fc360882eba8550d33bc833'
    end
  when '12'
    os_ver = '12'
    version '8.2.0'
    if arch == 'arm64'
      sha256 '4a6451f68f411ba7b3fa37d73e7b8c847b766bab6a0bc583effff33ca3b1be0e'
    elsif arch == 'x86_64'
      sha256 '794fd4d7c2bef6db359ca57b99842b31e0e9db8080f1b322034d0153c7cdd958'
    end
  else
    os_ver = '13'
    version '8.2.0'
    if arch == 'x86_64'
      sha256 '7f4731352886120fdf1eb201f4c3b146224907d35f6cbf14145aff26413988cd'
    elsif arch == 'arm64'
      sha256 '2bd11dbb7b1ed570b197638abf0e102ade0d029bd41fcd7bb914cc7c0658d5ff'
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
