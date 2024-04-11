cask 'puppet-agent-8' do
  if MacOS.version < :monterey
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '11'
    os_ver = '11'
    version '8.6.0'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 '955d3beeeb89b17cb0d5b0e32ad94ecfb46a051d1be8ddd768df21733e42e74d'
    end
  when '12'
    os_ver = '12'
    version '8.6.0'
    if arch == 'arm64'
      sha256 'ea4ad403099617a2644852acd3696abb95eb13f04676f7aee3d57b9a6e0eaa7f'
    elsif arch == 'x86_64'
      sha256 'edb9f476a6c96792b21ba21fc03c51424dd06f342e677179d813f79399c10646'
    end
  when '13'
    os_ver = '13'
    version '8.6.0'
    if arch == 'arm64'
      sha256 '8b1e3d8e3b9c74a84e5eb2cef3200d655607261a42b7e68af0631cc4c44071ba'
    elsif arch == 'x86_64'
      sha256 '2f2cf840b821236eee1a9d4c0507601ec2d3bb4f5c760d3abddb3af8e45f83dc'
    end
  else
    os_ver = '14'
    version '8.6.0'
    if arch == 'x86_64'
      sha256 '5045f2de5daf9872a5e9d4965d9ac9127918fb819acc376c00142594fc56bc9a'
    elsif arch == 'arm64'
      sha256 '83c569165474b50b41e3f42a6d2afb0d7e2bbb92282de0c1721d85a1bf4ef206'
    end
  end

  depends_on macos: '>= :big_sur'
  url "https://downloads.puppet.com/mac/puppet8/#{os_ver}/#{arch}/puppet-agent-#{version}-1.osx#{os_ver}.dmg"
  pkg "puppet-agent-#{version}-1-installer.pkg"

  name 'Puppet Agent'
  homepage "https://puppet.com/docs/puppet/#{version.major_minor}/about_agent.html"

  uninstall launchctl: [
                         'puppet',
                         'pxp-agent',
                       ],
            pkgutil:   'com.puppetlabs.puppet-agent'

  zap trash: [
               '~/.puppetlabs',
               '/etc/puppetlabs',
             ]
end
