cask 'pdk' do
  version '1.5.0.0'

  # TODO: change this to a case/switch once we add 10.13
  if MacOS.version <= :el_capitan
    sha256 '4de3c31b27aa0201a3c0eeff413a19349c10541854687ac3874aed49238a7983'
    url "https://puppet-pdk.s3.amazonaws.com/pdk/#{version}/repos/apple/10.11/PC1/x86_64/pdk-#{version}-1.osx10.11.dmg"
  else
    sha256 '713668b5113cf2d9309cfd199be0d9a52357d1c878c2aa8ef62ebb1ace55649b'
    url "https://puppet-pdk.s3.amazonaws.com/pdk/#{version}/repos/apple/10.12/PC1/x86_64/pdk-#{version}-1.osx10.12.dmg"
  end

  name 'Puppet Development Kit'
  homepage 'https://github.com/puppetlabs/pdk'

  depends_on macos: '>= :el_capitan'

  pkg "pdk-#{version}-1-installer.pkg"

  uninstall pkgutil: 'com.puppetlabs.pdk'
end
