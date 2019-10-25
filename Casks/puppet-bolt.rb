cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.35.0'
    sha256 '1d2b3c57d44f195106f7a4e01522833546ff74e92ecd3c9466019491eef766fe'
  when '10.12'
    os_ver = '10.12'
    version '1.35.0'
    sha256 '2ad3592cb4e2a9ee8077f972824e3551f8682ca560797e2aba7d3f1829dd72c4'
  when '10.13'
    os_ver = '10.13'
    version '1.35.0'
    sha256 '750ea48e09371a2728a2adf363c327eca0bbe45eb69cc911c2fa483e74b4a3a1'
  else
    os_ver = '10.14'
    version '1.35.0'
    sha256 '49abcd7019bb64fb329ba9be8b54b2b02aec69e2a462daadcee5e0f70e7bbb02'
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
