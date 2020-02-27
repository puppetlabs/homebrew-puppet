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
    version '1.17.0.0'
    sha256 'c73d2cdbd182d0bf0f7425a0dde01fcb03243eb407088ed6fc2d4a36c392c20e'
  else
    os_ver = '10.15'
    version '1.17.0.0'
    sha256 'cacf9bcf28c4d60964c78add21f5f918e357d17a4d26edfcdeaca5213ee23804'
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
