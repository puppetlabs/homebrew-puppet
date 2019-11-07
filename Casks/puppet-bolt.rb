cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.36.0'
    sha256 'd28e17fab43dc1ff7abf7f96f952ec4d71b294dbd34813bce35cfecb81f2df7b'
  when '10.12'
    os_ver = '10.12'
    version '1.36.0'
    sha256 'ec94d0b332b3ec2f035d5f65ab40192fb4077af0dd2313fffabb2d372f2dd6aa'
  when '10.13'
    os_ver = '10.13'
    version '1.36.0'
    sha256 '89979e935c7c4970c425c2bfefad18c2eb1fe12958d4eb6c8532232855038be8'
  else
    os_ver = '10.14'
    version '1.36.0'
    sha256 'd3274e0600c56aa654ea8827dfc88b763339aea8620eb9ca1fee9f9ba830659c'
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
