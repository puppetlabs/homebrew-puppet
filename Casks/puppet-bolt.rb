cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.13.0'
    sha256 'dd7fec0bfb7c3ac431a4f2e80e3db615fa24df0a3b7b820d48403260b97e50f5'
  when '10.12'
    os_ver = '10.12'
    version '1.13.0'
    sha256 '40176db6aa8f4d12b769cba3cfbcf54679d7391a6d49c21912c166b2cf479191'
  when '10.13'
    os_ver = '10.13'
    version '1.13.0'
    sha256 '8527a37e319b6c3a06bffbfee993540f22d66a835093b6590b8e67c546c8660f'
  else
    os_ver = '10.14'
    version '1.13.0'
    sha256 '76b70a6695bc34c2afade38c6c90a9aea8fd3e6696087da1cb0d280032e06c3d'
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
