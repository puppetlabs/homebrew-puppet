cask 'pdk' do
  case MacOS.version
  when '10.14'
    os_ver = '10.14'
    version '2.3.0.0'
    sha256 '81271634502b0e2f2ed11b07262ceec460f677cf2836af6e0b8ad9eed5e660ef'
  when '10.15'
    os_ver = '10.15'
    version '2.6.0.0'
    sha256 'ab3e90440f97bf98b965d8ba3707a0c88d3edabb2235d3db4567a129dc79619d'
  else
    os_ver = '11'
    version '2.6.0.0'
    sha256 '8a96286c76b4a19bfe701cdd058d27668288d58171dee47e6ada9c7dc3b34b8c'
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
