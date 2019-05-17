cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.20.0'
    sha256 'cd09e5d3568f7922fc3f7b21fa63116997e70043a0c89074944fa361398f0486'
  when '10.12'
    os_ver = '10.12'
    version '1.20.0'
    sha256 '8ea2e24c438b01f3f46bfb4e00a11ed2137c89234d640ec17785c080a98de878'
  when '10.13'
    os_ver = '10.13'
    version '1.20.0'
    sha256 '503cf8ad9569913c2972a440fe05362a3ee8104cefe39d7922396c50ede4207f'
  else
    os_ver = '10.14'
    version '1.20.0'
    sha256 'a466af59d5e4609eb961e3a1c95d8a0e17a3b2f3c1d4334b8bde3a5885913105'
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
