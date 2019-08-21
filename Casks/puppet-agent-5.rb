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
    version '5.5.16'
    sha256 'bfd8201dbe1f412509b3f04cb2603a47cbd1ad277823a07e8f2996b296c15baa'
  when '10.13'
    os_ver = '10.13'
    version '5.5.16'
    sha256 '4edcb2072d5b7a996a17557d279f2d678ec90c1c3ce85e9abf178fd857e09e1a'
  else
    os_ver = '10.14'
    version '5.5.16'
    sha256 'bdf83a55c4e6ee2ddd5802f10ddad0a79fb81e4681d8588d1e0912d045a54aef'
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
