cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    version '0.24.0'
    sha256 '9978c9fdae9e8d584777ccb65b3f4a6b981af4af8cb3bf41858ab0650880484a'
  when '10.12'
    version '0.24.0'
    sha256 '8df4666688760bbc448ebe929a2580f64cce08f9e57af1f6698e9e44b36fe56c'
  when '10.13'
    version '0.24.0'
    sha256 '05635eabdbec45edc9305080990d4ed26918125d9811d86eeb342427b7fa7ce1'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{MacOS.version}/x86_64/puppet-bolt-#{version}-1.osx#{MacOS.version}.dmg"
  pkg "puppet-bolt-#{version}-1-installer.pkg"

  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
