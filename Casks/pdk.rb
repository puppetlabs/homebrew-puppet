cask 'pdk' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.9.0.0'
    sha256 '997ad11c3e6b0c300ff2a0b822db2e93eea28f0a19036b404f4b14451c84cb9c'
  when '10.12'
    os_ver = '10.12'
    version '1.9.0.0'
    sha256 '9da5599e376b33a4086d52f38e49ab1eb8c746cb4b6fe313251b303d2a3aca1e'
  when '10.13'
    os_ver = '10.13'
    version '1.9.0.0'
    sha256 '776fc996b55ee6e829ac88c48e3104b540f92d140d7c272a634104a896ef9db1'
  else
    os_ver = '10.14'
    version '1.9.0.0'
    sha256 '509159873142378b282f8e6c1d645eb37480ecdc811747303057dbee77a95afc'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{os_ver}/x86_64/pdk-#{version}-1.osx#{os_ver}.dmg"
  pkg "pdk-#{version}-1-installer.pkg"

  name 'Puppet Development Kit'
  homepage 'https://github.com/puppetlabs/pdk'

  uninstall pkgutil: 'com.puppetlabs.pdk'
end
