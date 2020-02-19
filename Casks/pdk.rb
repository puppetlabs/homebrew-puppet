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
    version '1.16.0.2'
    sha256 '1c0053c0657e071ecfdb5464928e63802d57405f28e1c1500c27552ec24aee71'
  else
    os_ver = '10.14'
    version '1.16.0.2'
    sha256 '92068e4c4f571c91b6acb9d4937961b2a2b8dc1ebb97ecfb265aaad97b1d888d'
  end

  depends_on macos: '>= :el_capitan'
  url "https://downloads.puppet.com/mac/puppet/#{os_ver}/x86_64/pdk-#{version}-1.osx#{os_ver}.dmg"
  pkg "pdk-#{version}-1-installer.pkg"

  name 'Puppet Development Kit'
  homepage 'https://github.com/puppetlabs/pdk'

  pdk_bins = '/opt/puppetlabs/pdk/bin'
  caveats %Q(
    PDK binaries are installed in #{pdk_bins}, which is sourced by an /etc/paths.d entry.
    #{pdk_bins} may not be included in your current $PATH but should be included in new shells.
  )

  # Temporary fix for permissions problems in 1.16.0.1. They were fixed in
  # 1.16.0.2 but the dmg installer doesn't seem to update the permissions
  # during upgrade if that is the only change to the file.
  postflight do
    set_permissions '/opt/puppetlabs/pdk', 'a+rX'
  end

  uninstall pkgutil: 'com.puppetlabs.pdk'
end
