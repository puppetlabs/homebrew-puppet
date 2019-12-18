cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.43.0'
    sha256 '7cb36c8edce2f7144da47c88b26cb5b473869affd1402b5de8911fb7aedade28'
  when '10.12'
    os_ver = '10.12'
    version '1.43.0'
    sha256 'cf2ac73b1be2dc308a3b23265d69e237e803dca15260ab73444cac5d0708834f'
  when '10.13'
    os_ver = '10.13'
    version '1.43.0'
    sha256 'bf26d6713966813890c441717b2cb0e1743bc65aa1519521c8bd598c26a9e7d0'
  else
    os_ver = '10.14'
    version '1.43.0'
    sha256 'ab04c2c74a9a6e022c92ecf566e75c2652911377dea1ff7aacad2696e5bd9ef6'
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
