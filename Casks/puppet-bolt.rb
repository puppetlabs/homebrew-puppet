cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.49.0'
    sha256 'd3dbe1e4ed6a194b193784807753689d5fb9be494f2e01039f473d17cce57883'
  when '10.12'
    os_ver = '10.12'
    version '1.49.0'
    sha256 '172255ff98a3dd44f5bc27edef3090f469c3fcc88d18c469caa202d0d20602e6'
  when '10.13'
    os_ver = '10.13'
    version '1.49.0'
    sha256 '66890cb1564177476e15d87c7799db95119263e1900496b5154887389aa68bfa'
  else
    os_ver = '10.14'
    version '1.49.0'
    sha256 '853b564f84f8660837c61ec7e95460ea937d74823af1abdc85d542e2bbef3572'
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
