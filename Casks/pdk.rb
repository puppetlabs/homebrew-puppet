cask 'pdk' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.9.1.0'
    sha256 'ff13dca79ff0095c952fb1dd3c28eb12833fc5e959bc41e2e2f721ccb2b6f3e6'
  when '10.12'
    os_ver = '10.12'
    version '1.9.1.0'
    sha256 '9f79bff6af84e0211258123ed66bcd18821668d589018de938a2b66dab3ad386'
  when '10.13'
    os_ver = '10.13'
    version '1.9.1.0'
    sha256 'dc01507c7c4d6fc1d4ad02f52d6a2bc8d71c0be6f368b96566e661a524a9c133'
  else
    os_ver = '10.14'
    version '1.9.1.0'
    sha256 '9af2f4d61e1543587550950326e0e765c4bb1ea98bc15619072b2bcc559edd84'
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
