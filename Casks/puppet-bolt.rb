cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.39.0'
    sha256 '1f947640f29c4b57d5ad020d2bdcc0ee7e10cd83b5569ecfc61c0546a3e05716'
  when '10.12'
    os_ver = '10.12'
    version '1.39.0'
    sha256 'b09404b906a7ee0910e5b7ffc49d5b0dc63ac1727b725bb5c16994aa2a5d7f92'
  when '10.13'
    os_ver = '10.13'
    version '1.39.0'
    sha256 '561cd245c12e9bc7caa8f6a48fd89fdb3fe68d1cf26afed6a280a64dd9f67618'
  else
    os_ver = '10.14'
    version '1.39.0'
    sha256 '4072933294131f1966b13e772387cd002849ca6ed3266bec7db460eead845691'
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
