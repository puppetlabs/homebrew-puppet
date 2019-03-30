cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.15.0'
    sha256 '579672b084d896903e56bbe63e55aaf8bef4f4cb0a9d9793a51ec89f234b1b16'
  when '10.12'
    os_ver = '10.12'
    version '1.15.0'
    sha256 '3c5f81cffa9cd308edddda5f26d4cf21d4b3e1d561dc4e70c4667040a4679752'
  when '10.13'
    os_ver = '10.13'
    version '1.15.0'
    sha256 '0930cb7010dca1a1a5b8e26e3ca9d22bd39017ff7120d6acca4083f25369b85f'
  else
    os_ver = '10.14'
    version '1.15.0'
    sha256 'f8051c173f4010da602cbbe9adbc1a06402ae8ce5183d7a5ee720af7eb228b68'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{os_ver}/x86_64/puppet-bolt-#{version}-1.osx#{os_ver}.dmg"
  pkg "puppet-bolt-#{version}-1-installer.pkg"

  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  bolt_bins = '/opt/puppetlabs/bolt/bin'
  caveats %Q(
    Puppet Bolt binaries are installed in #{bolt_bins}, which is sourced by an /etc/paths.d entry.
    #{bolt_bins} may not be included in your current $PATH but should be included in new shells.
  )

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
