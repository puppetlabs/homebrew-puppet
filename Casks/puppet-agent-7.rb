cask 'puppet-agent-7' do
  case MacOS.version
  when '10.14'
    os_ver = '10.14'
    version '7.3.0'
    sha256 '31b51af474fa3d88228ef7234b62a87560ba3c5dac218ac2bde844de0d5fc8ca'
  else
    os_ver = '10.15'
    version '7.3.0'
    sha256 '6c9123b8a58daa02163b8b4ba2e206cf48bbec1cf37f481b104298d24ec42e4c'
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
