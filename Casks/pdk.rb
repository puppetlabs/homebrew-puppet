cask 'pdk' do
  if MacOS.version < :catalina
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '11'
    os_ver = '11'
    version '3.3.0.0'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 '607c0f213dfa3ace27fcdec1a80e3ef55f406d70482b829997bf9385c6a78423'
    end
  when '12'
    os_ver = '12'
    version '3.3.0.0'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 '9b7cc48378c7542da87109cea67eef424aa68b65877796f8fe8d8d5d3dfb5de0'
    end
  else
    os_ver = '13'
    version '3.3.0.0'
    if arch == 'x86_64'
      sha256 '630420593f50b8cf351bb9a4846a176b61162d0490da7bf9895b620d7c86183f'
    elsif arch == 'arm64'
      sha256 'daf4d05ca17ad0dea2c3413c0771a6bce5f8bf156ddf0c400d9d4ce99411d2d7'
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
