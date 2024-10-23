cask 'puppet-agent-8' do
  if MacOS.version < :monterey
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '11'
    os_ver = '11'
    version '8.10.0'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 '18da16a381eeaaf4de8ff3bab028c14173208e109fedb4d4a42e9b36acbb92a3'
    end
  when '12'
    os_ver = '12'
    version '8.10.0'
    if arch == 'arm64'
      sha256 'a4aa4da94effcc508eb71f81e341d80379cbe5362e07b344f0e3382c330a43cb'
    elsif arch == 'x86_64'
      sha256 '76c8e57f98230ce2eeb356228d2697ae0646bb1bcb4ad69ed1218b2c9108be3d'
    end
  when '13'
    os_ver = '13'
    version '8.10.0'
    if arch == 'arm64'
      sha256 'ebcc88012c95518c5e96ddd3bcdca86ced6740827957a5af4dbe1585d1c0bdd7'
    elsif arch == 'x86_64'
      sha256 '1f613d7c9d8238e0d4ed0fff49ea45023a1a11677f9f097766d7d1cbdc880129'
    end
  else
    os_ver = '14'
    version '8.10.0'
    if arch == 'x86_64'
      sha256 'a113b1454fcf8c07bdd3dac4979ab42f1412ff6a8e48d53ab0d17d59ada104eb'
    elsif arch == 'arm64'
      sha256 'd0163af2ecb22d926cf54a90452d1084818046604becfff569cfb1920905c9b0'
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
