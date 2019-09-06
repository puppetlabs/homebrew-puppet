cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.30.0'
    sha256 'b41ab7acf6d0c9f10d9263e1837b43aea207aa3d35b31c03d22ccc69fa580f1a'
  when '10.12'
    os_ver = '10.12'
    version '1.30.0'
    sha256 'a3bd95dd2b1ec9dfeebcb7d00cf1c6363773b62f3c131d4cc71cfdd119fb072f'
  when '10.13'
    os_ver = '10.13'
    version '1.30.0'
    sha256 '32f882cf45de5b63f98e27d47fe09c2d1eb889ef475d5187e9cf4eaec1c77f99'
  else
    os_ver = '10.14'
    version '1.30.0'
    sha256 '0d6a328887cd0fe4047d678a4c23d2c8328b4ba91f5151682b028572fa9629ba'
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
