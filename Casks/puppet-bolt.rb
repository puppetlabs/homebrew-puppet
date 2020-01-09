cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.44.0'
    sha256 '3637fae0bd7beb86db6fafffb93950029e5ac3b73b492a060b2df70ade2e9f24'
  when '10.12'
    os_ver = '10.12'
    version '1.44.0'
    sha256 '9b395ec7175da49975d49a11d84a10d4319d90928aa0ec8692e127e547bea95f'
  when '10.13'
    os_ver = '10.13'
    version '1.44.0'
    sha256 'c48045c29d24f6e92bec44403c103bcd6d4225709e169dac250493ef12e2c0c1'
  else
    os_ver = '10.14'
    version '1.44.0'
    sha256 '3e34c23d4290b1e2298a3c1963d9dc7dbcfc048ac15753acd3dd8ef3d0927ad9'
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
