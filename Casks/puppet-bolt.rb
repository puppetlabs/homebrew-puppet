cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    version '0.23.0'
    sha256 'b6ed90f3d27bf5c3fcca0c82ec05492c76d78bb6fe51c47d922c48b879419e1c'
  when '10.12'
    version '0.23.0'
    sha256 '5f03c909ab38f2add4f22cfa5a1a5a8292b6daf4738a47cb3c71c76203d276cf'
  when '10.13'
    version '0.23.0'
    sha256 'fd4601651d91058f69b8184a44e82e8dae853cff86d397883adde3d4223e75a1'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{MacOS.version}/x86_64/puppet-bolt-#{version}-1.osx#{MacOS.version}.dmg"
  pkg "puppet-bolt-#{version}-1-installer.pkg"

  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
