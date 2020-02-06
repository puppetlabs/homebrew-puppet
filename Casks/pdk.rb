cask 'pdk' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.16.0.1'
    sha256 'a50da11a63c140e2e0e60c90af6352de724705da1afb1e285315fe401d93889b'
  when '10.12'
    os_ver = '10.12'
    version '1.16.0.1'
    sha256 '92eb42d7e7dd45e85c4d9a3a2b8b107a3eb9459174d7300af9f67d63d5babb44'
  when '10.13'
    os_ver = '10.13'
    version '1.16.0.1'
    sha256 '47adc57a31ee275cb9beb31aa39a09ee6adde6425dd9669445861c33fece312d'
  else
    os_ver = '10.14'
    version '1.16.0.1'
    sha256 '88891e466db05273f2c961dd0df00adc2b4fded0f754946859271fa2d947b9be'
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
