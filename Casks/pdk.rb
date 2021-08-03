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
    version '2.2.0.0'
    sha256 '160f50d0f853e41b0c3b2549514ffb2b0cc646d42d4ac59251d0b13d33520e1c'
  when '10.15'
    os_ver = '10.15'
    version '2.2.0.0'
    sha256 '67ad3e04491b00d44f1dbba7ed638966b21fa19a2c3c21d1b176553589105c90'
  else
    os_ver = '11'
    version '2.2.0.0'
    sha256 '752f6d8a454754c3bd37518d7404aa93078c9b1d45b67675a2adc37acf409fbc'
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
