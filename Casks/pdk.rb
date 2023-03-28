cask 'pdk' do
  arch = 'x86_64'
  case MacOS.version
  when '11'
    os_ver = '11'
    version '2.7.1.0'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 '58086130971e34d9a365e6862265c8ed0a91b16885869420ff0e5f93034532cd'
    end
  else
    os_ver = '12'
    version '2.7.1.0'
    if arch == 'x86_64'
      sha256 'dff82317cb1e9c4ed29c6c706c5bb22220cf56bdba7179e7847db656204cc833'
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
