cask 'pdk' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.14.1.0'
    sha256 'b1739dd67c6c6eed58a4d19eef88187f5cfa53fcccee00688a433598db61d3ea'
  when '10.12'
    os_ver = '10.12'
    version '1.14.1.0'
    sha256 '5997448068371db5ab94decbb97c0aa7f1ca7ac20d7e1ac88a6ebdad27615c60'
  when '10.13'
    os_ver = '10.13'
    version '1.14.1.0'
    sha256 'db5c7d0e04c4e12b299212fcbded046d9615f70e30089852b177d544723fd55a'
  else
    os_ver = '10.14'
    version '1.14.1.0'
    sha256 '67d5d6da9ac2969c2f111d34e6f6fe4a69b265970eecb479958d212f8a74b6c2'
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
