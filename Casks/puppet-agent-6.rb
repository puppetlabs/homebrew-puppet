cask 'puppet-agent-6' do
  case MacOS.version
  when '10.12'
    os_ver = '10.12'
    version '6.10.1'
    sha256 '2916bb375639e4a6b6d7af61d23a5a8b41662d5d54e34aec819ef158403e834d'
  when '10.13'
    os_ver = '10.13'
    version '6.10.1'
    sha256 '62268ef60eb7b958e51673b140cbdad061946f748f23fe3442ab91ae56c699c5'
  else
    os_ver = '10.14'
    version '6.10.1'
    sha256 'c6f06e9898f3184cd97fd53afb54bc679fcdea77bfc00ed22bf0d77992d35339'
  end

  depends_on macos: '>= :sierra'
  url "https://downloads.puppet.com/mac/puppet6/#{os_ver}/x86_64/puppet-agent-#{version}-1.osx#{os_ver}.dmg"
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
