cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.12.0'
    sha256 '51b97820dd13ac76afea530f79ba2fce255ca7a04aaebb6021625e236886eb94'
  when '10.12'
    os_ver = '10.12'
    version '1.12.0'
    sha256 '2286ee1e5d05816a132ee1dd0a7a930d1f173010e722fa5796c34e4e03cde0c7'
  when '10.13'
    os_ver = '10.13'
    version '1.12.0'
    sha256 'e391ff71b22125fb9791623d96ab4d441829a8dec27056b36c092f94b78339ed'
  else
    os_ver = '10.14'
    version '1.12.0'
    sha256 '797ee05fbe91dc1c1b0abbb843eb6120d6dfd17552cf9afe1275dc7fb8550037'
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
