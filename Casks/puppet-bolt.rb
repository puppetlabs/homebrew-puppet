cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.42.0'
    sha256 'a12993d3681ebd687bc1bc7b731e2fa2191f37f5195c4f610cb76a96a7f28ed0'
  when '10.12'
    os_ver = '10.12'
    version '1.42.0'
    sha256 '7248270dce0c41780b52be769ed953acb47d12f74ac8d8ed8a3c6e6429498f8e'
  when '10.13'
    os_ver = '10.13'
    version '1.42.0'
    sha256 'b985d0576f5a4f10c1ed33b45afc6cdd1b9e6d94adaa00188faec39b172adacc'
  else
    os_ver = '10.14'
    version '1.42.0'
    sha256 '4b2f789413d7be50ade3475c1880b9bdf217f435f1f2ddcec2aea2bae3d35947'
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
