cask 'pdk' do
  if MacOS.version < :catalina
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '11'
    os_ver = '11'
    version '3.4.0.1'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 'a0b2226e82513dbbb180c412a00cc6c348d376aec6a606ca4e83c5db7d8e7cf5'
    end
  when '12'
    os_ver = '12'
    version '3.4.0.1'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 '1650bc3e9aee0521ac38803edea92a89371d5c62429df0774b850b4860f63295'
    end
  else
    os_ver = '13'
    version '3.4.0.1'
    if arch == 'x86_64'
      sha256 '4141d07a1eca2fd264ad18f963be8280bf55415312c993b4bc2ec1d6db614eef'
    elsif arch == 'arm64'
      sha256 '560df5c9d885cc6d5860d1a61d9b5e9cff9d852f6ab669dee610b7d77a30b062'
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
