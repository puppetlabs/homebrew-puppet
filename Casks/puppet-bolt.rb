cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.2.0'
    sha256 'ff029bb98dd81adff9e619aa39ccebd19020aa64fff4b585666a5e74f9801b95'
  when '10.12'
    os_ver = '10.12'
    version '1.2.0'
    sha256 'd5a3fb220db9698208c0f2ca0814b195e354b4908ee7c9a9ba19b429a6947e3f'
  else
    os_ver = '10.13'
    version '1.2.0'
    sha256 'a5b4d20aad6d9e73d9f393c10e3a80ff8800768bded2d866c91b6366b0e4ec9f'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{os_ver}/x86_64/puppet-bolt-#{version}-1.osx#{os_ver}.dmg"
  pkg "puppet-bolt-#{version}-1-installer.pkg"

  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
