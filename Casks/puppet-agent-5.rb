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
    version '5.5.12'
    sha256 '39bb8f3c28a8cfe356e803130ad4ce3647a55ce0ae57396d3bbfcdd5111dfac5'
  when '10.13'
    os_ver = '10.13'
    version '5.5.12'
    sha256 'a5219d235829efeb00fb967088e8e85754792560f0c0d6d14509e8149f8a9de8'
  else
    os_ver = '10.14'
    version '5.5.12'
    sha256 'eb2e61fc7e403e670f595d677c635711f293cbdb0bf936e46d41d5f9d9dc0558'
  end

  depends_on macos: '>= :yosemite'
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
