cask 'pdk' do
  arch = 'x86_64'

  case MacOS.version
  when '11'
    os_ver = '11'
    version '2.7.0.0'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 '833f326d7d638facae17a8ed10e2da121525fd3f2eecfaf4105d951190711519'
    end
  else
    os_ver = '12'
    version '2.7.0.0'
    if arch == 'x86_64'
      sha256 '162cf43958400b15b7f32b754939cb7f546f58275fa05a3dd9025eb20a5711cf'
    elsif arch == 'arm64'
      sha256 'nil'
    end
  end

  depends_on macos: '>= :el_capitan'
  url "https://downloads.puppet.com/mac/puppet-tools/#{os_ver}/#{arch}/pdk-#{version}-1.osx#{os_ver}.dmg"
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
