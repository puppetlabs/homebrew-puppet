cask 'pdk' do
  version '1.6.1.0'

  version_map = {
    high_sierra: { 
      sha: '99c2b03753bd054625160b08a30e1e572f3ae15736b66fba1628d8aef56398fe',
      ver: '10.13'
    },
    sierra: {
      sha: '1ab0bebdc30c7746224ed1b0301800c19212e21ee7a6ceb12846260ae05e333e',
      ver: '10.12'
    },
    el_capitan: {
      sha: '883cab7a8b99bc5bd56b998b2ff09551dc5b576b809c668e7dcb9257489cb95c',
      ver: '10.11'
    }
  }

  if MacOS.version == :high_sierra
    sha = version_map[:high_sierra][:sha]
    os_ver = version_map[:high_sierra][:ver]
  elsif MacOS.version == :sierra
    sha = version_map[:sierra][:sha]
    os_ver = version_map[:sierra][:ver]
  else
    sha = version_map[:el_capitan][:sha]
    os_ver = version_map[:el_capitan][:ver]
  end

  sha256 sha
  url "https://puppet-pdk.s3.amazonaws.com/pdk/#{version}/repos/apple/#{os_ver}/PC1/x86_64/pdk-#{version}-1.osx#{os_ver}.dmg"

  name 'Puppet Development Kit'
  homepage 'https://github.com/puppetlabs/pdk'

  depends_on macos: '>= :el_capitan'

  pkg "pdk-#{version}-1-installer.pkg"

  uninstall pkgutil: 'com.puppetlabs.pdk'
end
