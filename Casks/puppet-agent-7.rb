cask 'puppet-agent-7' do
  if MacOS.version < :catalina
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '11'
    os_ver = '11'
    version '7.29.0'
    if arch == 'arm64'
      sha256 '10376f328567118b4e01b1450017d508dabdfbec9f4f3655409ffcd09bc92df4'
    elsif arch == 'x86_64'
      sha256 'a9e71f4e3eed898a0d9b5307ccce1eaffcead5347ee051123eecc5883719118f'
    end
  when '12'
    os_ver = '12'
    version '7.29.0'
    if arch == 'arm64'
      sha256 'a99a0402ce16e74410b0cc3c39d12b74543b7c2c3f13418483b864f8d6f76b2b'
    elsif arch == 'x86_64'
      sha256 '7311f8597dd9bca3acc1bae3bc7858a645782dfe4fa76173e8517d428b2eef48'
    end
  when '13'
    os_ver = '13'
    version '7.29.0'
    if arch == 'arm64'
      sha256 '56bff289a803421fc393c06669b0baa7fb416b4b5e4204a0d7ea5903587e75a0'
    elsif arch == 'x86_64'
      sha256 'f2acc367815dafb252041c8818206c75e8f33e77a8099447bc353b87a4cfcd67'
    end
  else
    os_ver = '14'
    version '7.29.0'
    if arch == 'x86_64'
      sha256 'fe39ec95c24247baaf629c6e9eb2237e00a0627c469e6241d36a6014bf99b0c7'
    elsif arch == 'arm64'
      sha256 'f2ca9b8cd3e24cd4fe4c09dd0a440e99001398310316189975b895a58f12d8bc'
    end
  end

  depends_on macos: '>= :big_sur'
  url "https://downloads.puppet.com/mac/puppet7/#{os_ver}/#{arch}/puppet-agent-#{version}-1.osx#{os_ver}.dmg"
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
