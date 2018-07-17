cask 'puppet-bolt' do
  version '0.21.3'

  if MacOS.version == :el_capitan
    sha256 '65316da4dc80b7ba09d263f92c6ab7f1a031d75f9c067a840ba52433dea91b7a'
  elsif MacOS.version == :sierra
    sha256 '17e3e82b6493aa19d17c726bcd430203541b1ffe8501da2f823298c317b4e707'
  else
    sha256 '46b4c87aaf493acfacd29157e4de0ec18aebaf64e01399d57d8ac4d6c8c0747b'
  end

  # downloads.puppetlabs.com/mac was verified as official when first introduced to the cask
  url "http://downloads.puppetlabs.com/mac/puppet5/#{MacOS.version}/x86_64/puppet-bolt-#{version}-1.osx#{MacOS.version}.dmg"
  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  depends_on macos: '>= 10.11'

  pkg "puppet-bolt-#{version}-1-installer.pkg"

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
