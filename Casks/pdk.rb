cask 'pdk' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.11.1.0'
    sha256 '80557ec51b512c1a25b4b283e356d46458d04b1ed9baa5ab498d7919d4ad7349'
  when '10.12'
    os_ver = '10.12'
    version '1.11.1.0'
    sha256 '29e3387dae5e3e8bdb623c6647954363081a9c81444a2bdb62cfc52ea2aaa2f6'
  when '10.13'
    os_ver = '10.13'
    version '1.11.1.0'
    sha256 '02edf2ee2b1a7dbe05a7749c7663f2a0dec4dfbbcb670bb59b60667cf020501b'
  else
    os_ver = '10.14'
    version '1.11.1.0'
    sha256 '0de5787bbcc5e6cb107d6497f5674f45a913c5efbec820c46d728e765ce6bb27'
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
