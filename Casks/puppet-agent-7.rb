cask 'puppet-agent-7' do
  if MacOS.version < :catalina
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '11'
    os_ver = '11'
    version '7.29.1'
    if arch == 'arm64'
      sha256 '1a7f2116fd1ec5adcc4a9883eb5b70208a0653af795815a62ccdde1bcc33a8c0'
    elsif arch == 'x86_64'
      sha256 '70a472fa21c04d9a477aa269b9c359ff19734da0e390ba4ecfae3a485758ab47'
    end
  when '12'
    os_ver = '12'
    version '7.29.1'
    if arch == 'arm64'
      sha256 'a536045668d969e8155a3a78e2359719c0d09187e96416fa69d0810d92cb98e7'
    elsif arch == 'x86_64'
      sha256 '56f4662796100f85207d0d61e3fd874a20b595aae326d97f99f7161493109ee7'
    end
  when '13'
    os_ver = '13'
    version '7.29.1'
    if arch == 'arm64'
      sha256 '3e5e28f608956447166b2173081153523a7c313536a8e51c445184a23dc1389c'
    elsif arch == 'x86_64'
      sha256 '516eef7700795629ea26125e855bede8a4d45169be07f16e3a18155b0185bce7'
    end
  else
    os_ver = '14'
    version '7.29.1'
    if arch == 'x86_64'
      sha256 '2ea853aea0b1658d1b89b86e3cbef81adee3873aa2b162c9dc1c475268617461'
    elsif arch == 'arm64'
      sha256 '0113172edca88faffb205e7ecfc18e7980d763513fc1e96830948245d9bc1ed2'
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
