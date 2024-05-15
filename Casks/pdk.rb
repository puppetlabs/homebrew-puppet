cask 'pdk' do
  arch = 'x86_64'
  version '3.2.0.1'

  case MacOS.version
  when '11'
    os_ver = '11'
    sha256 '204e84fc01ff386a808e4775fc07e335f0e471cc0700355198c42ec67d6befbe'
  when '12'
    os_ver = '12'
    sha256 '8e75486f6c950f566e1843b1b7c41a2641767b1c43faad138d479cd1e25a574e'
  else
    os_ver = '13'
    sha256 'b634140bae18a6c7009e08b2a92383ccbe12512eacecd45c5c0cd07a6415d5b8'
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
