cask 'puppet-bolt' do
  case MacOS.version
  when '10.11'
    version '0.21.7'
    sha256 'ccff6ce054e825c7c38af879d1b184d464acf04ec02531bbf89df341229cf590'
  when '10.12'
    version '0.21.7'
    sha256 'f158616055af24248ec74e87bdba9111b958a8d3ddca7aa43d1a48d38b473413'
  when '10.13'
    version '0.21.7'
    sha256 '1af9d5a781bd675bf861d2d381e09ada066ababafd8b60e80fcce03efa518b50'
  end

  depends_on macos: '>= 10.11'
  url "https://downloads.puppet.com/mac/puppet5/#{MacOS.version}/x86_64/puppet-bolt-#{version}-1.osx#{MacOS.version}.dmg"
  pkg "puppet-bolt-#{version}-1-installer.pkg"

  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
