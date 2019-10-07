cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.32.0'
    sha256 '3d06e6009c121259bc65c0de3a6d07d9e52ad30a82e9e91b0869df720eb802bb'
  when '10.12'
    os_ver = '10.12'
    version '1.32.0'
    sha256 '9bbb3c044df1343f808a17df69e57127b981bced4a4b9bcd1c052bd8064381e6'
  when '10.13'
    os_ver = '10.13'
    version '1.32.0'
    sha256 '53cf3d012f898e55cb3aa0ed2d1964672e08cdccb6ff5169fdeb2a530e5d0fe9'
  else
    os_ver = '10.14'
    version '1.32.0'
    sha256 'ea21775f42db9298725119dc604a01c4801d7d45d9fc457ec79cbb841676ac31'
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
