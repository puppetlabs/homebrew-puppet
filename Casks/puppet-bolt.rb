cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.0.0'
    sha256 '6d521200b91f1c590546d6a7ffbff1e105bf31e634fa63f88a5eea3459d5a003'
  when '10.12'
    os_ver = '10.12'
    version '1.0.0'
    sha256 'ac6aae7f85c0b3c887b9b8dfd939e3c43776b8bd1e66cab558a70fe77661b60d'
  else
    os_ver = '10.13'
    version '1.0.0'
    sha256 '6c0291522ec72d001ea0dc633553f85545a44529698cec67a851919a2bd06f0c'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{os_ver}/x86_64/puppet-bolt-#{version}-1.osx#{os_ver}.dmg"
  pkg "puppet-bolt-#{version}-1-installer.pkg"

  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
