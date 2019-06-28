cask 'pdk' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.11.0.0'
    sha256 'c3c604756035fc448779e44e4470ab0017a5497fa01f4595bc06648f1da8ff8f'
  when '10.12'
    os_ver = '10.12'
    version '1.11.0.0'
    sha256 '30be30ab06889f27c9d61fe9782aa7490cfc846bc1435c55f5b7961040fe0599'
  when '10.13'
    os_ver = '10.13'
    version '1.11.0.0'
    sha256 'f6017f4c7f662f2c166b3d6f50fc90b721b8f4efe97b2d254962dd0b4667cf45'
  else
    os_ver = '10.14'
    version '1.11.0.0'
    sha256 'd6d8ab3babb244cfaabc8b52e6541532e71d38a50d6bfb98f755cef5e5e65612'
  end

  depends_on macos: '>= 10.11'
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
