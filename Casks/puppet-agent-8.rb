cask 'puppet-agent-8' do
  if MacOS.version < :monterey
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '11'
    os_ver = '11'
    version '8.3.1'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 'ad712bbe795abd0f663be092de31ef50d271ba4a1ee7520d79da0a9264512e32'
    end
  when '12'
    os_ver = '12'
    version '8.3.1'
    if arch == 'arm64'
      sha256 '02a54f15848305ece3b9a036284226f907ebe36fb14ea1513970e882bee4bead'
    elsif arch == 'x86_64'
      sha256 '47650ef7fcbb6b5bea08666985386e2841ffbeb38f9da4f579138c2c5ea8601b'
    end
  else
    os_ver = '13'
    version '8.3.1'
    if arch == 'x86_64'
      sha256 'bade9d2f17310d0107be28a9aacc8cb06aeb4b0cbed4e6e8faeef12036c0d68a'
    elsif arch == 'arm64'
      sha256 '92ba0db110dd0d2c8c20e3594ea3e8be46287376daf456d5c84c68d1ec2c06cb'
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
