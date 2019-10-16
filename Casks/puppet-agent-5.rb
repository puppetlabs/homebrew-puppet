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
    version '5.5.17'
    sha256 '187998fa66b20b296b1e9fae342534b9e18e38f1eefa3f7d9e2fe1dca0644055'
  when '10.13'
    os_ver = '10.13'
    version '5.5.17'
    sha256 'b50680b1d4d5f4ffef03d50bcd33cde73007657086bdca7060fb07ce0d3e6e2a'
  else
    os_ver = '10.14'
    version '5.5.17'
    sha256 'b6e5cd9857e01a0044ffd1f8332da792c85b0b4e03e1336c1d5aeb5bfae1f592'
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
