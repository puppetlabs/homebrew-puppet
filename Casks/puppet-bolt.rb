cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.25.0'
    sha256 'c1012e380423e46b69e9b4e54203eebed75b1cc241ca679a9e5fd8e1f590997f'
  when '10.12'
    os_ver = '10.12'
    version '1.25.0'
    sha256 '3f76822d93c7266bc9c9c38b46aeb5a3f0d33e64023f3bf5976aa93c3169d239'
  when '10.13'
    os_ver = '10.13'
    version '1.25.0'
    sha256 '824eb9b2ff622ce7178fe8970541e4d2851c7df1293ae7f85415450c8023656e'
  else
    os_ver = '10.14'
    version '1.25.0'
    sha256 '8f087cba3dd1cf716407c81f326cd79d744e37ef68a231aa7e6598a57adf9acf'
  end

  depends_on macos: '>= 10.11'
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
