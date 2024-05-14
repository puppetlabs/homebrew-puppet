cask 'pdk' do
  arch = 'x86_64'
  case MacOS.version
  when '11'
    os_ver = '11'
    version '3.2.0.1'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 'f60918ddb5760997c7a2da433d30ca4eca0f96dfdc9435e67b33cce3a7fe99fb'
    end
  when '12'
    os_ver = '12'
    version '3.2.0.1'
    if arch == 'x86_64'
      sha256 '2524c5470acf9ecaad4b4da2aeb57352361ef6038920ba5a94d7d575c4df0dd0'
    elsif arch == 'arm64'
      sha256 'nil'
    end
  else
    os_ver = '13'
    version '3.2.0.1'
    if arch == 'x86_64'
      sha256 '5c4966abcb808ae1858bf6f539cb93b187dee176dc8907fc72c331c086de9ac9'
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
