cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.14.0'
    sha256 '9febe4fca812bb01a853c67e2c011b0d8d343d51d9485a5f1308fc0490baed26'
  when '10.12'
    os_ver = '10.12'
    version '1.14.0'
    sha256 '679d1b7e2e90244e787ef67c8211a58e9efe331be367ae64e17f41180581d35b'
  when '10.13'
    os_ver = '10.13'
    version '1.14.0'
    sha256 '23d6f3046e8457d5d962ba49fd3bb0b209e7db4bd940d0260cf6f2ecfa8c8ccf'
  else
    os_ver = '10.14'
    version '1.14.0'
    sha256 '84a09f4dc109907e4c353b4afed8c36ea72778d104a22996eb19b1775e92ec2b'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{os_ver}/x86_64/puppet-bolt-#{version}-1.osx#{os_ver}.dmg"
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
