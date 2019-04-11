cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.16.0'
    sha256 '65381f32528c5195562bd75a81a305c67f85d679f69134c44afae1eac2a52b9f'
  when '10.12'
    os_ver = '10.12'
    version '1.16.0'
    sha256 '998a63985bde41dc2e7c5286a678d5100b890548b539fc15e11d7bd4db16f543'
  when '10.13'
    os_ver = '10.13'
    version '1.16.0'
    sha256 '5c9047267c432fd3a8454a22c2b226793cfe00d8f38cfb141b24ec36cfc49479'
  else
    os_ver = '10.14'
    version '1.16.0'
    sha256 '344b00ee945c5f1ed5f0014bceb1d26aebda91969b67bc28c751e77c3906e9fa'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{os_ver}/x86_64/puppet-bolt-#{version}-1.osx#{os_ver}.dmg"
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
