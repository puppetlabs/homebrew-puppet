cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.22.0'
    sha256 'e5556c68c6703f74ad5200a42f895a315ddb2f031fa1bad8c9959a5a87bf76dd'
  when '10.12'
    os_ver = '10.12'
    version '1.22.0'
    sha256 '0efd86e967c63c606bcd550459d774659ca885aeeb16bc9ec05418bb2628a6f2'
  when '10.13'
    os_ver = '10.13'
    version '1.22.0'
    sha256 'e2c0d8cbb453e5383a4e932daf8b5d20b86cf6d38697c494f950de63de6f8635'
  else
    os_ver = '10.14'
    version '1.22.0'
    sha256 '80ed4dd5f26ac10b107b0427a1dff5c10b6c5201063b84edde02060959e94c9c'
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
