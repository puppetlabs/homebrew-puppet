cask 'pdk' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.8.0.0'
    sha256 'a5c404e7a33ca2f47aa575958a9f0f879ef5f5ac909e48fe2b6b0cfe69ff4fa7'
  when '10.12'
    os_ver = '10.12'
    version '1.8.0.0'
    sha256 '26548072664f6126975ba205e5334c28a05da68a50bd1534b4785c7293e196bc'
  else
    os_ver = '10.13'
    version '1.8.0.0'
    sha256 'f0418c82df0745c0968def1ec2639610777c7492bc979a4fd34c0a3dc33ecda1'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{os_ver}/x86_64/pdk-#{version}-1.osx#{os_ver}.dmg"
  pkg "pdk-#{version}-1-installer.pkg"

  name 'Puppet Development Kit'
  homepage 'https://github.com/puppetlabs/pdk'

  uninstall pkgutil: 'com.puppetlabs.pdk'
end
