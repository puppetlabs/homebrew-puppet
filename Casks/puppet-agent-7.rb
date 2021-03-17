cask 'puppet-agent-7' do
  case MacOS.version
  when '10.14'
    os_ver = '10.14'
    version '7.5.0'
    sha256 '7d3f7012149c8fdf40934b57fd0c57319600db831ce912f71f820f8ab564c20b'
  else
    os_ver = '10.15'
    version '7.5.0'
    sha256 '8fa2856f7671099afd84a224a19090ab1ed88feeecfb7945c9818783c0f7921e'
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
