cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.41.0'
    sha256 '5e18882736bc03cb6c7bc9d4030c7af564c7c892b924bb6d1c934c32f40cd08b'
  when '10.12'
    os_ver = '10.12'
    version '1.41.0'
    sha256 '171a859547a699144f1140637fe2c42ae812dd249fcae0a22d4056747dcdb4d3'
  when '10.13'
    os_ver = '10.13'
    version '1.41.0'
    sha256 '9f17c80da656c659409a519f937efd3b07da54d86ceb581a82129501cbe2da51'
  else
    os_ver = '10.14'
    version '1.41.0'
    sha256 'f31ed1fc631fa0efbc9a9cc1f994fbe96f234c28b8dda4d1886e0e81c7034dd8'
  end

  depends_on macos: '>= :el_capitan'
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
