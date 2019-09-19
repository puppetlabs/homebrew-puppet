cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.30.1'
    sha256 '23160eb77c60d59ebb28baf1f407e336ad848177db6011eb59ea24f36331a92f'
  when '10.12'
    os_ver = '10.12'
    version '1.30.1'
    sha256 '514c31a16d0876d01cd83a655e8c369f2c4f5f608ea50a87f947e1b84e9b87c0'
  when '10.13'
    os_ver = '10.13'
    version '1.30.1'
    sha256 'eb9f5e164780c1e5c7ddd5a6e5cfeccb21ad41367975bbbbc0355ff6c26805c2'
  else
    os_ver = '10.14'
    version '1.30.1'
    sha256 'e4956f8b4c1ce4762a58625d0bd77200200e81ce994c1cabacbe35990e51bfe0'
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
