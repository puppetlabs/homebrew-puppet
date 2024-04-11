cask 'puppet-agent-7' do
  if MacOS.version < :catalina
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '11'
    os_ver = '11'
    version '7.30.0'
    if arch == 'arm64'
      sha256 'd18c1d9e69ae9afea562051da30be6e8798b316beea8e11b7fd47d3b005092c9'
    elsif arch == 'x86_64'
      sha256 '6ee542e383a225e3dd31c2997a5c44d1c3989476d34db1486f8c8e386cea00ee'
    end
  when '12'
    os_ver = '12'
    version '7.30.0'
    if arch == 'arm64'
      sha256 '3d090b7650796f7f3b8226dfe5c6eb10e1cbe8a4df16b0d792a4612522e20d85'
    elsif arch == 'x86_64'
      sha256 '5968c759afb09b85aa8619c2f372e2c43e0c0ed24f06f840335a178f22b0c0b5'
    end
  when '13'
    os_ver = '13'
    version '7.30.0'
    if arch == 'arm64'
      sha256 'b24c0ad1869103aa37f000a33871464ef7cb078939929c6e9506c830b2006b61'
    elsif arch == 'x86_64'
      sha256 'be503370b6e41fdd46ef6622822179abeb5c71b7bb1b8b703605dd81e61a7da1'
    end
  else
    os_ver = '14'
    version '7.30.0'
    if arch == 'x86_64'
      sha256 '285ba352e5f294363c21015c6a2b9d859a3e840f1ab7f5d6a1de0269c9318dab'
    elsif arch == 'arm64'
      sha256 '8656f39f5831debcdcfc52965155eacb6bb6825c1b8161cbdaf6e493357dcc9e'
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
