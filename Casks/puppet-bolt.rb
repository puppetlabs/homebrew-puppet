cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '1.3.0'
    sha256 '0c315407860fed947e851d1aa1b903815357a4de129e6b983ca6aa089180f280'
  when '10.12'
    os_ver = '10.12'
    version '1.3.0'
    sha256 '02f63f578db0f223329185a3f901ec917ec0b7423685609bdf44dee75efe863a'
  else
    os_ver = '10.13'
    version '1.3.0'
    sha256 '3763902ba7244c9408afd5c71aacbf80f6650f4f3bb1e6ef4f4d1169f0410845'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{os_ver}/x86_64/puppet-bolt-#{version}-1.osx#{os_ver}.dmg"
  pkg "puppet-bolt-#{version}-1-installer.pkg"

  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
