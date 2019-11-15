cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.38.0'
    sha256 'd684c5d7263898fa59af6a050f0378c9a560dbf30f104dc9d3b6784be95cee95'
  when '10.12'
    os_ver = '10.12'
    version '1.38.0'
    sha256 'b2520dfdc397a43449bc224e428addca8937925c9db7b8de265379cd520e181c'
  when '10.13'
    os_ver = '10.13'
    version '1.38.0'
    sha256 '805512d03b6d9e0e96e2a1d8cf747e16f504c4b116d4bab55fd3aaf946d385bc'
  else
    os_ver = '10.14'
    version '1.38.0'
    sha256 'fdd40c5479d266570593b2aaf175fa9dc7f569ab7ab97b0b603249ca8bfd1106'
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
