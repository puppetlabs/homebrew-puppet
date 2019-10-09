cask 'pdk' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.14.0.0'
    sha256 '9c6a957b9f06ba0d1cec4e1c48d75426cbb857d0531057ba4ab237c1ab6f32c8'
  when '10.12'
    os_ver = '10.12'
    version '1.14.0.0'
    sha256 '927c190cb23d797c49066a813e319df7b08e0af62134be05613b5677c05031de'
  when '10.13'
    os_ver = '10.13'
    version '1.14.0.0'
    sha256 '52b1245a9765603e8807e870b102569786e6a761b7c494e2e52e982d01f60e81'
  else
    os_ver = '10.14'
    version '1.14.0.0'
    sha256 '805e32b2fbd5869bc4361d15888fe7a84379fdf298647b505b387536f629efdb'
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

  uninstall pkgutil: 'com.puppetlabs.pdk'
end
