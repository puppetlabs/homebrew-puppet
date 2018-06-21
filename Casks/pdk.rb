cask 'pdk' do
  version '1.6.0.0'

  version_map = {
    high_sierra: { 
      sha: 'cd4e2719d83f0b14df3f284c2b903cccda8cc9ac7f0d8de53f8bfa26dc8e0427',
      ver: '10.13'
    },
    sierra: {
      sha: '4c9b64e8f228a8a42996b38b26091c053c5bbcbb3340fd4f78354c981f100f64',
      ver: '10.12'
    },
    el_capitan: {
      sha: '1b298bc1842318dc9b47792e5c2959487218e1a1f2cd94e855a3575b0a5aa139',
      ver: '10.11'
    }
  }

  case MacOS.version
  when :high_sierra
    sha = version_map[:high_sierra][:sha]
    os_ver = version_map[:high_sierra][:ver]
  when :sierra
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
