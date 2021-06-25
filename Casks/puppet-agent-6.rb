cask 'puppet-agent-6' do
  case MacOS.version
  when '10.12'
    os_ver = '10.12'
    version '6.13.0'
    sha256 '3577c3656b40014a97a409423db6b70dca80accab550b7966ecc0dd5c4fa9007'
  when '10.13'
    os_ver = '10.13'
    version '6.13.0'
    sha256 '2e4f6a316b633200fd2a9c0a0b57e3dea785c9f9c19e07ad4e295cdd00914b10'
  when '10.14'
    os_ver = '10.14'
    version '6.23.0'
    sha256 'd790996935566f045dc213892cd6612213f1322d5a9bf5131913d94b55eacfc9'
  when '10.15'
    os_ver = '10.15'
    version '6.23.0'
    sha256 '34f4b2b6e50479ddaf7c18669bee725ead5c090e89cf2a7a9025a4b8a839c0f5'
  else
    os_ver = '11'
    version '6.23.0'
    sha256 '1f82321ee3211e98f5e8e3ca1f6ea49c9f3ced52439ba72c43c29c943abcc7c6'
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
