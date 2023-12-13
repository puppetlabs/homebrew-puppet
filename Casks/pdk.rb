cask 'pdk' do
  arch = 'x86_64'
  case MacOS.version
  when '11'
    os_ver = '11'
    version '3.0.1.3'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 '4f172474364d7ca1f98adf4923822f55f06df7522551f201cc1d2d39ebb70fd6'
    end
  else
    os_ver = '12'
    version '3.0.1.3'
    if arch == 'x86_64'
      sha256 '7a01a66fdcc1e2d0cbd03c13d6998d5d96a527cb78c678c1387ffe06e6c44fbc'
    elsif arch == 'arm64'
      sha256 'nil'
    end
  end

  depends_on macos: '>= :big_sur'
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
