cask 'puppet-agent-7' do
  case MacOS.version
  when '10.14'
    os_ver = '10.14'
    version '7.7.0'
    sha256 'f86ae90d5a0e2daea0222ae2507ffa25e27ff994424becb236bc2f20747b5985'
  when '10.15'
    os_ver = '10.15'
    version '7.7.0'
    sha256 '70fdf750c1542a1b68c48241e8d6c4322401714eb99f8c548eb2d7e3df92feeb'
  else
    os_ver = '11'
    version '7.7.0'
    sha256 '8dcfb8caaefcfdba1dc4f453a3c35261e579b54305d029f7de67d2862b3662f8'
  end

  depends_on macos: '>= :mojave'
  url "https://downloads.puppet.com/mac/puppet7/#{os_ver}/x86_64/puppet-agent-#{version}-1.osx#{os_ver}.dmg"
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
