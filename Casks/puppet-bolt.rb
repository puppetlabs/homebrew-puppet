cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.11.0'
    sha256 'c0190edd1c44ac4413100063c521482d54b746d938d0ab74a3c94afb3a95406d'
  when '10.12'
    os_ver = '10.12'
    version '1.11.0'
    sha256 '7509c224d704e3665ac3c31b9da4054338e5a59466e9e2d936a32aa9439eb803'
  when '10.13'
    os_ver = '10.13'
    version '1.11.0'
    sha256 '123707b7389fbdbc2a6d70568289cb65f1f1ca99771bdb317cef97dd71c4c318'
  else
    os_ver = '10.14'
    version '1.11.0'
    sha256 '068e192372e5d98f191dff56af306034c28bade4ce4daeff9e371a40c608983e'
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
