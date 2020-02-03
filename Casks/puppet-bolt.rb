cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.48.0'
    sha256 '62269e08645cc9209916ec4848182b27f78d6de1c252917aed2b13379c5e6f97'
  when '10.12'
    os_ver = '10.12'
    version '1.48.0'
    sha256 '929b6622bf32e10d3343cadbe042f75d1b1674aa0a491a9fd85d8a0784d2d21e'
  when '10.13'
    os_ver = '10.13'
    version '1.48.0'
    sha256 '2fb5ba7b26c3b3be12acc948a04d83bd2058f3e43460f59d82287e64b0e03816'
  else
    os_ver = '10.14'
    version '1.48.0'
    sha256 '2ec9948fa2b4aaa72d4b108c1235dc5fc4cf526c538b395a0af117cc9cb2bfe0'
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
