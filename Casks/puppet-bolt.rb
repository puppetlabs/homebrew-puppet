cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.27.0'
    sha256 '386d07bb75593a8f7bb028fb39cca2d8f21065cac40c5b91781d988fea7406fe'
  when '10.12'
    os_ver = '10.12'
    version '1.27.0'
    sha256 '9480ebc8cbf39d9b0128b4bd5dd70abaa1d2b4ec27448634331707f4a139b697'
  when '10.13'
    os_ver = '10.13'
    version '1.27.0'
    sha256 '24330ad783d4c9f1f33f701faf73371fc5166c0e839f49a5579d6ad7f770e150'
  else
    os_ver = '10.14'
    version '1.27.0'
    sha256 '88fe804a5ca6e0bb7f82caf7b046260844cd76f5519d18a8f45b39e00f536fc7'
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
