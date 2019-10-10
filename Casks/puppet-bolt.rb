cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.33.0'
    sha256 '9a9251144765c84606915192fac351c5a57a06a4184475e9d2155a354af078e6'
  when '10.12'
    os_ver = '10.12'
    version '1.33.0'
    sha256 '0c406e6076bb3e01427cd6321aa9c6a9b4d293a83f2337c493c5774de9ba7417'
  when '10.13'
    os_ver = '10.13'
    version '1.33.0'
    sha256 '3f2c07a36498c38e37602ccb9bf37cd449134ecb0dae5e3aa78decb7bede1e36'
  else
    os_ver = '10.14'
    version '1.33.0'
    sha256 '466d77c49af4f14acd77b0b5825d50a760bbd956703e7bab31b8f2c8d323cc3b'
  end

  depends_on macos: '>= :el_capitan'
  url "https://downloads.puppet.com/mac/puppet/#{os_ver}/x86_64/puppet-bolt-#{version}-1.osx#{os_ver}.dmg"
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
