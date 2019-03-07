cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.13.1'
    sha256 '45fbb5b4b852bffa63413d2aa85c23306f66fc7e95f3fa6cbae799d460b7f4c0'
  when '10.12'
    os_ver = '10.12'
    version '1.13.1'
    sha256 '619ff21d90a58a5b023bcfe26dae060025127a72a0d6838f54750f8951287057'
  when '10.13'
    os_ver = '10.13'
    version '1.13.1'
    sha256 '8ec8ba482ee97ef5c05f06bd07c56dab7fcadbdf9e1482e4b15fc8460b278e0b'
  else
    os_ver = '10.14'
    version '1.13.1'
    sha256 'cff8aa337952b05152f50ec92530d05cce34d43816dc167c87710cb6ea6a3e16'
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
