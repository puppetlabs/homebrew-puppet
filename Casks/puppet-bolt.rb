cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.21.0'
    sha256 '330a4076fc634fe26f26685c356b1593550bf37ec5b9f01f7e70b754a920addc'
  when '10.12'
    os_ver = '10.12'
    version '1.21.0'
    sha256 'c71e4e6af84667d6dcee60f1ae143f40470972ef7c4045f54b6bccbe1db882eb'
  when '10.13'
    os_ver = '10.13'
    version '1.21.0'
    sha256 '365a4de77e782e1e70b78b45d09f9c1608f64dc943c693171a3b28073b1a7b61'
  else
    os_ver = '10.14'
    version '1.21.0'
    sha256 'c68f5a6625603d3f7704280940513a03b89115400647abb56a11cfea663dff81'
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
