cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.18.0'
    sha256 '04e800b3e5dcf0fdaca472d2089be961892c6bbe612845d3fd39b3a97709056c'
  when '10.12'
    os_ver = '10.12'
    version '1.18.0'
    sha256 '6a951ce022c7a78d27c6cb5930cf356d54c03804d5462a1aac9166d3e526b3f3'
  when '10.13'
    os_ver = '10.13'
    version '1.18.0'
    sha256 '434c7f4ac1d3194bc5677f4aeb74f6d71d3e128a30a8671e40404226cd2460e1'
  else
    os_ver = '10.14'
    version '1.18.0'
    sha256 'a96da7fb496d4b17c67ffcc0bedd6add7b4da05b94e0193d2a7fb444d9bef592'
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
