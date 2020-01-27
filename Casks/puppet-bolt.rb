cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.47.0'
    sha256 '737030cd56afb69f2b94219ef88553e76a3e2e54aff25645d69a2c3a07485edf'
  when '10.12'
    os_ver = '10.12'
    version '1.47.0'
    sha256 '5c2f6edba6269d52fc8a7da58d92d8ef3415b99ee866cd1822620327a056bf1d'
  when '10.13'
    os_ver = '10.13'
    version '1.47.0'
    sha256 '1db8f8af947ae491083ff8737ef86b2efda162c67cdcc2b4c88475a3ea50c453'
  else
    os_ver = '10.14'
    version '1.47.0'
    sha256 'dafc76ce8a1d0fbfe793a210392332ac76e3a00860829bc491b375362e27e7a4'
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
