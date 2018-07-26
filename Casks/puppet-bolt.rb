cask 'puppet-bolt' do
  version '0.21.4'

  if MacOS.version == :el_capitan
    sha256 'd72ee404eb4f233ef65eb4962e05d21935406d10296da97bb8198d054bc467a0'
  elsif MacOS.version == :sierra
    sha256 '9792b240d773acaf94e02f8fcf89f8bd284e64ce9714b205cce60e0970771ae9'
  else
    sha256 '8c64f3a39a504b1c007cbd9103b1d0601df0f29f787ec1c100c3bf60b7ff18bf'
  end

  # downloads.puppetlabs.com/mac was verified as official when first introduced to the cask
  url "http://downloads.puppetlabs.com/mac/puppet5/#{MacOS.version}/x86_64/puppet-bolt-#{version}-1.osx#{MacOS.version}.dmg"
  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  depends_on macos: '>= 10.11'

  pkg "puppet-bolt-#{version}-1-installer.pkg"

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
