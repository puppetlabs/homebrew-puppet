cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.24.0'
    sha256 'e8f68921dfe6310f759797e5502322f7558cae39af275e51ab4ed6d0121557e8'
  when '10.12'
    os_ver = '10.12'
    version '1.24.0'
    sha256 '92ede7cb7279f39f61c408fe9d3f3a8013a143bf786a70e3406272d27c1c2959'
  when '10.13'
    os_ver = '10.13'
    version '1.24.0'
    sha256 '2136ee1088179048b8cbf2ba5ac5726858398126eafc5ed3b46677f90ff8b631'
  else
    os_ver = '10.14'
    version '1.24.0'
    sha256 '8f0a08245ede700dc6f243bf1ad4a556d0156d8bad742b1a428e36c4c5e48e97'
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
