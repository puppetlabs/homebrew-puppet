cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.28.0'
    sha256 '1b0adeaf3b64eef20109fca4852875a9cae878b97bd8566d89654f1cb49f966e'
  when '10.12'
    os_ver = '10.12'
    version '1.28.0'
    sha256 '264b28c49fb5bbeb3337c8949e4ffd82e102c9e9164ee33d9a921c054f042914'
  when '10.13'
    os_ver = '10.13'
    version '1.28.0'
    sha256 'e420bccb29b394a41a45c522cc0fc3b102fbcb941e4eea8047c64f92359a785b'
  else
    os_ver = '10.14'
    version '1.28.0'
    sha256 'c9743f33762a8fde50e27e2fed3c523e42af0378a37eab803a5f953235ba6a1a'
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
