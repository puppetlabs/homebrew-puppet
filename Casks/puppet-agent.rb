cask 'puppet-agent' do
  case MacOS.version
  when '10.14'
    os_ver = '10.14'
    version '7.8.0'
    sha256 'a7eaff09647fabef22be2eedcd1fedc184e551bb625d02a43b122c4de4d39a1e'
  when '10.15'
    os_ver = '10.15'
    version '7.8.0'
    sha256 '0d068d542cd24aa0d18d8a40abce6c3ec7ff363dba5c8057018cadff9bbf8eee'
  else
    os_ver = '11'
    version '7.8.0'
    sha256 '86b22b7c09e32eeba103e3c5f8c482bbe1629613316d05cf45ffeb6b76380f1e'
  end

  depends_on macos: '>= :mojave'
  url "https://downloads.puppet.com/mac/puppet/#{os_ver}/x86_64/puppet-agent-#{version}-1.osx#{os_ver}.dmg"
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
