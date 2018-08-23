cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    version '0.21.8'
    sha256 'b65e50a5a5d2946e227937a06c7ef315901d1ad11933835ccfc2722e2d31e465'
  when '10.12'
    version '0.21.8'
    sha256 'b324010d75beec3d98f3a29f498b0827e9adc227bc3c068e5ad61b8c3c14d22e'
  when '10.13'
    version '0.21.8'
    sha256 '9fe93ffb49441b9fb0be7e900ef26663f9f9b9d48b9c2f6051c1d48af5f1858a'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{MacOS.version}/x86_64/puppet-bolt-#{version}-1.osx#{MacOS.version}.dmg"
  pkg "puppet-bolt-#{version}-1-installer.pkg"

  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
