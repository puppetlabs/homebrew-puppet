cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.31.0'
    sha256 '3034284dc4c2bab16aff145520c32266c558dcfed3fa62f46c690ad04f94a237'
  when '10.12'
    os_ver = '10.12'
    version '1.31.0'
    sha256 'dba654120491c2c7ddaae19005c9c6158e81ea88a74d2037d5f39ce375c7618c'
  when '10.13'
    os_ver = '10.13'
    version '1.31.0'
    sha256 '1d372107b04a5a73c2d221f1ca4990a10eadc5799716a174adccaf8203fd76a2'
  else
    os_ver = '10.14'
    version '1.31.0'
    sha256 '2512d6ff5f091e1115c73d5745716baf5f2153401b36751dc122d57d159480cf'
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
