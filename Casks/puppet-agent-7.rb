cask 'puppet-agent-7' do
  if MacOS.version < :catalina
    arch = 'x86_64'
  else
    arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  end

  case MacOS.version
  when '10.15'
    os_ver = '10.15'
    version '7.24.0'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 '33dfbd3214eb3cbfa319425ac54106699a27f94a9b04fb39995979056464ffe9'
    end
  when '11'
    os_ver = '11'
    version '7.24.0'
    if arch == 'arm64'
      sha256 '33e1e315ee90441faf34062df50136a32dd5a5fb6c46ed88d862b14a6ea5b438'
    elsif arch == 'x86_64'
      sha256 '00bd110c26ae3479fa410469969ece3f5159240fcff188af26f1afc4b24cf2c2'
    end
  else
    os_ver = '12'
    version '7.24.0'
    if arch == 'x86_64'
      sha256 '492fb1dc3fb1da1fb9f10bb21dd8a4f39bc2d77eb07b129ca8b04f0d36cabc58'
    elsif arch == 'arm64'
      sha256 'ad37f0acbdd78b0af785419bde9bbf44a03d01cf3392baafd8c68c432a811577'
    end
  end

  depends_on macos: '>= :catalina'
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
