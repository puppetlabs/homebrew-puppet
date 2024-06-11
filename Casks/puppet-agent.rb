cask 'puppet-agent' do
  if MacOS.version < :catalina
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '11'
    os_ver = '11'
    version '7.31.0'
    if arch == 'arm64'
      sha256 'b36dbf6b597cdbbbded624bd0fc5216adc8d3ea89f645680abbb17ae0f4012fe'
    elsif arch == 'x86_64'
      sha256 'b6851e802aa76745e434d84107ff82e93764d2e810774b05ea8897abe203220e'
    end
  when '12'
    os_ver = '12'
    version '7.31.0'
    if arch == 'arm64'
      sha256 'f423fd9f142acd0fefeabfa4154c4dbee70a85b28d67a8b1ee28502fd9d1ba0b'
    elsif arch == 'x86_64'
      sha256 'b4850e3312287d5dc37039249594d199dbd5fe5be3c4caa3a6cf2c7973570e62'
    end
  when '13'
    os_ver = '13'
    version '7.31.0'
    if arch == 'arm64'
      sha256 '63281828da6fe1b2ddff2ad8e536136a6626911ba40e51deec1420c43e7ea2fc'
    elsif arch == 'x86_64'
      sha256 '6f747aa90b22515e13da4b786804b7c5f28deb8e3d77a1b7bfa959b02b01d72e'
    end
  else
    os_ver = '14'
    version '7.31.0'
    if arch == 'x86_64'
      sha256 '5b05d7b511d63d6b35c23bc3e3f5be39d431e5a11a9503d398a6c40bcdd69f12'
    elsif arch == 'arm64'
      sha256 'e7ebb0eaef52349f35cb25c71b5be2986cf13f9fb0c54900ab128ea599a12bdb'
    end
  end

  depends_on macos: '>= :big_sur'
  url "https://downloads.puppet.com/mac/puppet/#{os_ver}/#{arch}/puppet-agent-#{version}-1.osx#{os_ver}.dmg"
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
