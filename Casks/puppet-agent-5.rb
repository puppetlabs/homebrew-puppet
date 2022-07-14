cask 'puppet-agent-5' do
  case MacOS.version
  when '10.10'
    os_ver = '10.10'
    version '5.5.0'
    sha256 '3f30c36e9b39763839148aaea400193c7b52d8feea2765121f6dabace658ec25'
  when '10.11'
    os_ver = '10.11'
    version '5.5.0'
    sha256 'fe60c24d2b964f161599bf4594c9e871f161707375b81c6b1e998e8cfce13058'
  when '10.12'
    os_ver = '10.12'
    version '5.5.18'
    sha256 '0f701c542a7c234f86b1b92d07ae1272716ae1be339e8505546be5eebcdcb4fb'
  when '10.13'
    os_ver = '10.13'
    version '5.5.18'
    sha256 'be76193cd6298e372667fc65381a7f711c0585a2f70c355014dc4d59ae8948f6'
  when '10.14'
    os_ver = '10.14'
    version '5.5.22'
    sha256 '23b7e87a7a69cfe234ba292d93e763f0a61740b3d32cc9717c73b35c31774840'
  else
    os_ver = '10.15'
    version '5.5.22'
    sha256 '5914ccf0d1c4a90688458fc1cb12ee1282a737e3841f9997975477c7d97baf61'
  end

  url "https://downloads.puppet.com/mac/puppet5/#{os_ver}/x86_64/puppet-agent-#{version}-1.osx#{os_ver}.dmg"
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
