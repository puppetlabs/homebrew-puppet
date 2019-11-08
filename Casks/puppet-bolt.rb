cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.37.0'
    sha256 'e04f7144fe8ce3b2baddaafe0a89fbee8c9f91b84b9d3965b72f3c18b646b5fa'
  when '10.12'
    os_ver = '10.12'
    version '1.37.0'
    sha256 '8f690f0c2f545aa0bbb1100257c0a2c964949dc5401bbbee127caa928008be9f'
  when '10.13'
    os_ver = '10.13'
    version '1.37.0'
    sha256 '6bda1da93206043b9d1bc9758557ef9c82e315ac539b8313ac3b2404797dddd8'
  else
    os_ver = '10.14'
    version '1.37.0'
    sha256 'f27eb8ea7926633b12ed7277a6a226ced713170f5f36d5fd84e7c0cbf35d37e0'
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
