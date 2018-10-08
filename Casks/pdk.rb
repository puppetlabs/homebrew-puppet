cask 'pdk' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.7.1.0'
    sha256 '7cb760fbbb2142ca9e3732a34f7a560de0bfb7aae54d699c074f9c623cdbb299'
  when '10.12'
    os_ver = '10.12'
    version '1.7.1.0'
    sha256 '7cca4a1910d71f41726493e061b3065053660ecc581c79494590e1d151c1174c'
  else
    os_ver = '10.13'
    version '1.7.1.0'
    sha256 '36d6e0e4c923a8ab07336a4bd82351d478c4af3a5eba0c7569bbf351555827b6'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{os_ver}/x86_64/pdk-#{version}-1.osx#{os_ver}.dmg"
  pkg "pdk-#{version}-1-installer.pkg"

  name 'Puppet Development Kit'
  homepage 'https://github.com/puppetlabs/pdk'

  uninstall pkgutil: 'com.puppetlabs.pdk'
end
