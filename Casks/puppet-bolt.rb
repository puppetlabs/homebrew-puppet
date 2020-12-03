cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '2.0.0'
    sha256 'a0fcb0a8d100ff9294ef7d6d9c00c569c97fa3c25bc857d08b4c6b53aaf2e50d'
  when '10.12'
    os_ver = '10.12'
    version '2.0.0'
    sha256 '3e36904194a51c01c1b406837a998107938ef5d58081c308c0ac2e377624e64f'
  when '10.13'
    os_ver = '10.13'
    version '2.0.0'
    sha256 'f7cdfd892b5ebdd795626e3a5c21cc769b6f946d5f686a0e98f389100eb674ac'
  when '10.14'
    os_ver = '10.14'
    version '2.36.0'
    sha256 '670359530f1825bc0bfcf328d21a1f9ad4ab605b234df846b7f6a3d7ee47fa57'
  else
    os_ver = '10.15'
    version '2.36.0'
    sha256 '14111da825fe29542e6a401982e388f920756be8dacab1fa5c8ed4498104a9d8'
  end

  depends_on macos: '>= :el_capitan'
  url "https://downloads.puppet.com/mac/puppet-tools/#{os_ver}/x86_64/puppet-bolt-#{version}-1.osx#{os_ver}.dmg"
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
