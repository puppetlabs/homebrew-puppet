cask 'puppet-agent-7' do
  if MacOS.version < :catalina
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '10.15'
    os_ver = '10.15'
    version '7.21.0'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 '00679fefb1116774e265455b7c3bad05badeacbcdde845c428ba0b2bcaf8cf3e'
    end
  when '11'
    os_ver = '11'
    version '7.21.0'
    if arch == 'arm64'
      sha256 '88a7a8b584bd2211b42182cc59c6a9ec83c1ceeb7b9b511a9d9635afe698854b'
    elsif arch == 'x86_64'
      sha256 'fe37b9192f44f14b679d2b0e90e711b6e3cbde98d97b2fa2be2bcb8171be5518'
    end
  else
    os_ver = '12'
    version '7.21.0'
    if arch == 'x86_64'
      sha256 '3caee32c99efcd58fad2f71682792367b69986d4481033961828ad8c22c62ed2'
    elsif arch == 'arm64'
      sha256 '585a51599bd92a578f582cb8476f3d459f4a91ecc18add2fccde32492db3f1b6'
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
