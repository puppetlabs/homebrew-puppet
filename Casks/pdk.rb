cask 'pdk' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.13.0.0'
    sha256 '89b5a7e1283ad4510340da38420d86662b2d40004bc7307bd68ec34e5760ad69'
  when '10.12'
    os_ver = '10.12'
    version '1.13.0.0'
    sha256 'd68b6c704d7d06a79e1c00522098fcda7087b77230686480067cf3d86259cc73'
  when '10.13'
    os_ver = '10.13'
    version '1.13.0.0'
    sha256 '12ff57d7c4161a8e5090be905afac5393abe2344d3fb067350e04a1b5dfd9c41'
  else
    os_ver = '10.14'
    version '1.13.0.0'
    sha256 'bd6d1b5233e220664f42c202f7030d730149586b45d90137d858b62e30a53a8a'
  end

  depends_on macos: '>= :el_capitan'
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
