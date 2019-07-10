cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.26.0'
    sha256 'a6681668dbfb7c173b2a9951f71ebfd687a3f36b6524a0245eaf4782ba7f7811'
  when '10.12'
    os_ver = '10.12'
    version '1.26.0'
    sha256 '860e1d1e9183858f87b5e5dde92b2d8b307fc8f445933f4e2c829c16e5dffb73'
  when '10.13'
    os_ver = '10.13'
    version '1.26.0'
    sha256 'f8b5a1bcf180ab52f3e873de91070ee1f9fe531a7b6ad956573eb3816b542296'
  else
    os_ver = '10.14'
    version '1.26.0'
    sha256 '106b6c1b7af3d7921f2a1de06d5a0079c02d8ec7c97f5fea13c7c59ba2d41b38'
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
