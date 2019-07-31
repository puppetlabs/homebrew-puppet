cask 'pdk' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.12.0.0'
    sha256 'ce4c4cd69d54a67ff1067e1e5a412894af49635c42f358901983e52f6bb51e0a'
  when '10.12'
    os_ver = '10.12'
    version '1.12.0.0'
    sha256 'b9d3f430c5437650b09e826eaf58a8b3d47496b5709df5a58649b290cd4faab9'
  when '10.13'
    os_ver = '10.13'
    version '1.12.0.0'
    sha256 '894136fce7fa91d6444817cb1e71740bf2330179e27fff6f22a90a827722b359'
  else
    os_ver = '10.14'
    version '1.12.0.0'
    sha256 '23015cb190e70d4af40e226175db18f400a4f5ff9bf935d40d29aea4a72d5efb'
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
