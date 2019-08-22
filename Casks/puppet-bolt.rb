cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.29.1'
    sha256 '02c7872e5ec00e1dc4c44860988cbfd2beb8e918c4ce178741996e16100edf41'
  when '10.12'
    os_ver = '10.12'
    version '1.29.1'
    sha256 '695f6c2491d1d5f8846d8966e73cf41f2d2fd9f834928cfb325a4c888d8bc943'
  when '10.13'
    os_ver = '10.13'
    version '1.29.1'
    sha256 'a5b5ef967543a40201d2a30cc0604a87ee701bf39829828e9450bd4e9745c71d'
  else
    os_ver = '10.14'
    version '1.29.1'
    sha256 'bb2f92ac5b001a7fb90387b5929aca2e275bdb382a90f124b38c7fcf2de3dd12'
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
