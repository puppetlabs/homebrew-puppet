cask 'pdk' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.15.0.0'
    sha256 'df270ba66de5b37c64ee970aec06cfd08f105984b978c965c99e3634db053311'
  when '10.12'
    os_ver = '10.12'
    version '1.15.0.0'
    sha256 'de717de5f74a6e6127b5d8c349fff15cf4b8e680ad697e68a58173af227fdcd6'
  when '10.13'
    os_ver = '10.13'
    version '1.15.0.0'
    sha256 'ac60b2fe2588944e8108538830d3a88cd7507db188ac14aeb2051a8cb6bf11b9'
  else
    os_ver = '10.14'
    version '1.15.0.0'
    sha256 '2b41461a0838367c8da30588055d2464ac3001dd606349dd2af4b32f78db1023'
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
