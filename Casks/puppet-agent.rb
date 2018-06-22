cask 'puppet-agent' do
  os_ver = MacOS.version.to_s
  
  if MacOS.version == :yosemite
    version '5.5.0-1'
    sha256 '3f30c36e9b39763839148aaea400193c7b52d8feea2765121f6dabace658ec25'
  elsif MacOS.version == :el_capitan
    version '5.5.0-1'
    sha256 'fe60c24d2b964f161599bf4594c9e871f161707375b81c6b1e998e8cfce13058'
  elsif MacOS.version == :sierra
    version '5.5.4-1'
    sha256 '07ff138cd5c9c77fb0aa7822f21b5aa52314afebb18a25fca4efb8a86f9d604f'
  else
    version '5.5.4-1'
    sha256 '5138c22d4c2d75111b23d3a927a26e6a82d936cf2145dbd031e602799edcd1a8'
  end
  
  url "https://downloads.puppetlabs.com/mac/puppet/#{os_ver}/x86_64/puppet-agent-#{version}.osx#{os_ver}.dmg"
  appcast "https://downloads.puppetlabs.com/mac/puppet/#{os_ver}/x86_64/"
  name 'Puppet Agent'
  homepage "https://puppet.com/docs/puppet/#{version.major_minor}/about_agent.html"

  depends_on macos: '>= :yosemite'

  pkg "puppet-agent-#{version}-installer.pkg"

  uninstall launchctl: [
                         'puppet',
                         'pxp-agent',
                         'mcollective',
                       ],
            pkgutil:   'com.puppetlabs.puppet-agent'

  zap trash: [
               '~/.puppetlabs',
               '/etc/puppetlabs',
             ]
end
