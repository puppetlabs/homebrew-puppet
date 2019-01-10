cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.9.0'
    sha256 '921cf6a8aa87b945d9fc3e023609ea182a020ac3fb2d70fea4662921370a1405'
  when '10.12'
    os_ver = '10.12'
    version '1.9.0'
    sha256 '901b9695e281b7c07f486ee7bd5b6e40c2efe7cc3b992f09265fa40397c1fb60'
  else
    os_ver = '10.13'
    version '1.9.0'
    sha256 '4611bd6e5198fe65be3f4e293676fea662b4ae2ee8790945c85a1456a5db8518'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{os_ver}/x86_64/puppet-bolt-#{version}-1.osx#{os_ver}.dmg"
  pkg "puppet-bolt-#{version}-1-installer.pkg"

  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
