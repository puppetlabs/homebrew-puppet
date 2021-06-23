cask 'pdk' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.16.0.2'
    sha256 'ead0d9089225efe5270e59790253011392b02a37d615d82c7d19faa78df1fa4b'
  when '10.12'
    os_ver = '10.12'
    version '1.16.0.2'
    sha256 '2c1c39ee111be3325c8bc2e36323d3b60d504ba5038053a1aa8d4d3567f79642'
  when '10.13'
    os_ver = '10.13'
    version '1.17.0.0'
    sha256 'e260500af2cbe07d31b880bffe5c7bcc1b3823cc3472a75829e8a582b197931d'
  when '10.14'
    os_ver = '10.14'
    version '2.1.1.0'
    sha256 'c52b5d1f536223a0cee54bb10e26c8d455abf8d499d832b17c61821ad6b3ea3c'
  else
    os_ver = '10.15'
    version '2.1.1.0'
    sha256 '4739e9a5b375243d526956963ef10a53457fcab33cda10b45c820511f2f74e7a'
  end

  depends_on macos: '>= :el_capitan'
  url "https://downloads.puppet.com/mac/puppet-tools/#{os_ver}/x86_64/pdk-#{version}-1.osx#{os_ver}.dmg"
  pkg "pdk-#{version}-1-installer.pkg"

  name 'Puppet Development Kit'
  homepage 'https://github.com/puppetlabs/pdk'

  pdk_bins = '/opt/puppetlabs/pdk/bin'
  caveats %Q(
    PDK binaries are installed in #{pdk_bins}, which is sourced by an /etc/paths.d entry.
    #{pdk_bins} may not be included in your current $PATH but should be included in new shells.
  )

  uninstall pkgutil: 'com.puppetlabs.pdk'
end
