cask 'puppet-bolt' do
  version '0.21.5'

  case MacOS.version.to_sym
  when :el_capitan
    sha256 '3f4ee7a24ffb30553383f31b19dd9049a22c355cb46b3a36e03292a4fdcd5dc4'
  when :sierra
    sha256 'e3f9bf05bbd3b1cb388011883398823cfc512a24baa8311a782f04366cedd37c'
  when :high_sierra
    sha256 '565476058d6ae0db02d290aa810d5de67585623e5c79a9220e7f54881ed2af81'
  end

  url "https://downloads.puppet.com/mac/puppet5/#{MacOS.version}/x86_64/puppet-bolt-#{version}-1.osx#{MacOS.version}.dmg"
  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  depends_on macos: '>= 10.11'

  pkg "puppet-bolt-#{version}-1-installer.pkg"

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
