cask 'puppet-agent-8' do
  if MacOS.version < :monterey
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '11'
    os_ver = '11'
    version '8.9.0'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 '73ac9fe067367e2add2ee74da33dcbf9763d17ba385ccc863db4e8bb18e39540'
    end
  when '12'
    os_ver = '12'
    version '8.9.0'
    if arch == 'arm64'
      sha256 'cf3afee29ac84b99da0f6c0b376e1727919b7fc6afe5e337381a1e52c042b9b4'
    elsif arch == 'x86_64'
      sha256 '07424f9a9d317dd6a08b7a7c13d9a0e011d30f99ac77313ee8789cb719de8c92'
    end
  when '13'
    os_ver = '13'
    version '8.9.0'
    if arch == 'arm64'
      sha256 '88905c2321f5b60e81fcf5b15c446ab40132170e4f618b91cae57daa28425fe7'
    elsif arch == 'x86_64'
      sha256 '2147c553811a1d9f2ba58cc0eece893f76a25b9f0ab726db00b8c4c036e6ae96'
    end
  else
    os_ver = '14'
    version '8.9.0'
    if arch == 'x86_64'
      sha256 'af8a9614ae427f3bb395d045bea15eb8463b7dd8cb94bc3616fa66783ecab952'
    elsif arch == 'arm64'
      sha256 'e7a48f7ca0091687dccddc0f9c23bbb64bc9f5233c7b9925cdc54b6b544e434a'
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
