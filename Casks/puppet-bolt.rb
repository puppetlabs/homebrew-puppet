cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.17.0'
    sha256 '257ae71774e2ec892a4066a65506c85a618c646cb176ecda1595a8342e739101'
  when '10.12'
    os_ver = '10.12'
    version '1.17.0'
    sha256 '333fc8aac380d2c32ce7866c4311b13b67a8415214db3b597d989840f6e3c8fe'
  when '10.13'
    os_ver = '10.13'
    version '1.17.0'
    sha256 'd7b0129d6a1cbc3987261aef0eb12d267cf6d46db361b3bfb2e784e4966c5605'
  else
    os_ver = '10.14'
    version '1.17.0'
    sha256 'ec83a6fbd4a7381e34e2726c02538c1e70e9e7bf20d00990cfbef56f916a5d51'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet/#{os_ver}/x86_64/puppet-bolt-#{version}-1.osx#{os_ver}.dmg"
  pkg "puppet-bolt-#{version}-1-installer.pkg"

  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  bolt_bins = '/opt/puppetlabs/bolt/bin'
  caveats %Q(
    Puppet Bolt binaries are installed in #{bolt_bins}, which is sourced by an /etc/paths.d entry.
    #{bolt_bins} may not be included in your current $PATH but should be included in new shells.
  )

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
