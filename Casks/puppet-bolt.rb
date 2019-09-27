cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.31.1'
    sha256 '30b9db4caf35e9fed9f737f9c475876cdb149699ff617e08ba34b502da069e16'
  when '10.12'
    os_ver = '10.12'
    version '1.31.1'
    sha256 '4b9f2b51c5c981770ced71378c58283aa6058984f1b72c053ed9ae4bf21e9911'
  when '10.13'
    os_ver = '10.13'
    version '1.31.1'
    sha256 'fa7370898833d81beaa3aefaacc5bb4c55bdbf0984b4591a5390d534522c46e7'
  else
    os_ver = '10.14'
    version '1.31.1'
    sha256 'ef4121fa50a220b598cdfa94c11e7298a20d2b54906d857321a16c755d8dece6'
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
