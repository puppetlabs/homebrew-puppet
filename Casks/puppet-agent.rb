cask 'puppet-agent' do
  case MacOS.version
  when '10.10'
    version '5.5.0'
    sha256 '3f30c36e9b39763839148aaea400193c7b52d8feea2765121f6dabace658ec25'
  when '10.11'
    version '5.5.0'
    sha256 'fe60c24d2b964f161599bf4594c9e871f161707375b81c6b1e998e8cfce13058'
  when '10.12'
    version '5.5.4'
    sha256 '07ff138cd5c9c77fb0aa7822f21b5aa52314afebb18a25fca4efb8a86f9d604f'
  when '10.13'
    version '5.5.4'
    sha256 '5138c22d4c2d75111b23d3a927a26e6a82d936cf2145dbd031e602799edcd1a8'
  end

  depends_on macos: '>= 10.10'
  url "https://downloads.puppet.com/mac/puppet5/#{MacOS.version}/x86_64/puppet-agent-#{version}-1.osx#{MacOS.version}.dmg"
  pkg "puppet-agent-#{version}-1-installer.pkg"

  name 'Puppet Agent'
  homepage "https://puppet.com/docs/puppet/#{version.major_minor}/about_agent.html"

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
