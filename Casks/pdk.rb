cask 'pdk' do
  case MacOS.version
  when '10.14'
    os_ver = '10.14'
    version '2.3.0.0'
    sha256 '81271634502b0e2f2ed11b07262ceec460f677cf2836af6e0b8ad9eed5e660ef'
  when '10.15'
    os_ver = '10.15'
    version '2.5.0.0'
    sha256 'eb58747a34acdba3dc78295f29892b22b80088c622c0416ad81c012e964533e4'
  else
    os_ver = '11'
    version '2.5.0.0'
    sha256 'ad8ad667505be1cbc9ed45c4f9bc62af3278c5fb61fd4b33cdc4cec18d9055c5'
  end

  depends_on macos: '>= :mojave'
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
