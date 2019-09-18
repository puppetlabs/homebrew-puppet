cask 'puppet-agent' do
  case MacOS.version
  when '10.12'
    os_ver = '10.12'
    version '6.9.0'
    sha256 '517a53dad95e0581face8fc8c6b8bb1d0941f624a6de05aae43ea8af2dcb7827'
  when '10.13'
    os_ver = '10.13'
    version '6.9.0'
    sha256 '8a4fdd6a171847ba56c7e9d5eae77e64f8fb7f26e311df3fdbd900075fe46fa4'
  else
    os_ver = '10.14'
    version '6.9.0'
    sha256 '24f33b80d1aa3fbe6827ba4035e7a3379c5db8902f6ab779cea91ff86fd33aa6'
  end

  depends_on macos: '>= :sierra'
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
