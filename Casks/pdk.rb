cask 'pdk' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.10.0.0'
    sha256 '721005b6b2d367de6d7708d084db3a4dd607024fd112c33396a46c0be0f050e8'
  when '10.12'
    os_ver = '10.12'
    version '1.10.0.0'
    sha256 '92f7aa4b40aa25ef33db304cc024c093e01af945c4ac3e7d37603ee956ade5b8'
  when '10.13'
    os_ver = '10.13'
    version '1.10.0.0'
    sha256 '76bbdd4f09d566621d31da83bd4ff480f0b8a2fbeec0764e03ac7d7bf822f296'
  else
    os_ver = '10.14'
    version '1.10.0.0'
    sha256 'f67b6eaf7ca0571fca2018c90621ab905c07aa582b59322b657ab4155f2ce940'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{os_ver}/x86_64/pdk-#{version}-1.osx#{os_ver}.dmg"
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
