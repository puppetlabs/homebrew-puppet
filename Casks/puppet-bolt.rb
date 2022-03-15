cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '2.0.0'
    sha256 'a5956c7d075a6219f04cda8890732bb8e31b4e10ad0096e18046531b43cfdd7d'
  when '10.12'
    os_ver = '10.12'
    version '2.0.0'
    sha256 '9d14f5106bb1c882971658ca00537fd1f1e176685f31588637eab8b95feba0d7'
  when '10.13'
    os_ver = '10.13'
    version '2.0.0'
    sha256 'ec644414592e24f685e41f696e9830958b5c2223b7d489038529520faf3d3352'
  when '10.14'
    os_ver = '10.14'
    version '3.13.0'
    sha256 '22dc674608197d63c5c1bd199dc4337eff2822ea6cb9fefab3a1cc4ee3ec7187'
  when '10.15'
    os_ver = '10.15'
    version '3.21.0'
    sha256 'a54dc977d4b970f1d557de68f6671e15c7bbf6cbe5a469c01ce6c35289df4c38'
  else
    os_ver = '11'
    version '3.21.0'
    sha256 'fbfee80c47c3bf7f7900e59096a85988da89c2309640e010c4217a6ae95439f7'
  end

  depends_on macos: '>= :el_capitan'
  url "https://downloads.puppet.com/mac/puppet-tools/#{os_ver}/x86_64/puppet-bolt-#{version}-1.osx#{os_ver}.dmg"
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
