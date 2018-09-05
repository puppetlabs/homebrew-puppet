cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    version '0.22.0'
    sha256 '2f883553f674f7ea1c703c896931b1497ebca75cf58699b5bcaf6cce22b7c5a8'
  when '10.12'
    version '0.22.0'
    sha256 'f2f12be16dc3a73f32e5b68b99695a44cd865deb0ec55acc982635de5e663491'
  when '10.13'
    version '0.22.0'
    sha256 '6cbbde8ba4386268e4032cf9086b5638fd25e336aaf7d4cd695869cb233b8645'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{MacOS.version}/x86_64/puppet-bolt-#{version}-1.osx#{MacOS.version}.dmg"
  pkg "puppet-bolt-#{version}-1-installer.pkg"

  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
