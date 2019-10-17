cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.34.0'
    sha256 '853ada4ce8ae8659b34191ff81b8ab2edeae05f5c3828b83c169669f667f351e'
  when '10.12'
    os_ver = '10.12'
    version '1.34.0'
    sha256 '276c032fa700209a272616adb113b26317dca680bb2d959bc75ec10b38b2d286'
  when '10.13'
    os_ver = '10.13'
    version '1.34.0'
    sha256 'a4558b949e23a637d7e90acdeba210c74c13f6d500ed67fade5940c9ffc8b38f'
  else
    os_ver = '10.14'
    version '1.34.0'
    sha256 '7bbb00cc0dc89b721a57edd129cbc003cf2fc46ebab60819658e058ac6a0c7d4'
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
