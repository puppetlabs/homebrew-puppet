cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.29.0'
    sha256 '795429ad298aaa36969f8130befdfb96f249f4d7b5743fc2321e9749d2c8dbec'
  when '10.12'
    os_ver = '10.12'
    version '1.29.0'
    sha256 '949c85a3ca55206ceceb2b249364d7dd77b6ada2aca7fcab29b7dda658975102'
  when '10.13'
    os_ver = '10.13'
    version '1.29.0'
    sha256 'd63603d9795f99319872082369501f7d7ea2e39198dedb2e4339e5824681ed92'
  else
    os_ver = '10.14'
    version '1.29.0'
    sha256 '9f068f26389ca59f0b1ada7cf76e9688a7b9aec70a9ab78f3ce5428d1aa4f18f'
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
