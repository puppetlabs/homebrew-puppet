cask 'puppet-bolt' do
  ## TODO: BOLT-1604, enable this when we build packsages for ARM.
  ## For now the x86 emulator on mac seems to work well enough (and users are already on it),
  ## so just statically set arch to x86_64 now
  arch = 'x86_64'
  # if MacOS.version < :catalina
  #   arch = 'x86_64'
  # else
  #   arch = Hardware::CPU.intel? ? 'x86_64' : 'arm64'
  # end

  case MacOS.version
  when '10.11'
    os_ver = '10.11'
    version '2.0.0'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 'a5956c7d075a6219f04cda8890732bb8e31b4e10ad0096e18046531b43cfdd7d'
    end
  when '10.12'
    os_ver = '10.12'
    version '2.0.0'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 '9d14f5106bb1c882971658ca00537fd1f1e176685f31588637eab8b95feba0d7'
    end
  when '10.13'
    os_ver = '10.13'
    version '2.0.0'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 'ec644414592e24f685e41f696e9830958b5c2223b7d489038529520faf3d3352'
    end
  when '10.14'
    os_ver = '10.14'
    version '3.13.0'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 '22dc674608197d63c5c1bd199dc4337eff2822ea6cb9fefab3a1cc4ee3ec7187'
    end
  when '10.15'
    os_ver = '10.15'
    version '3.22.1'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 '4f17695d85a321260a5d60ab67a490c99cb27be9cdb83ef50e906be36163fb24'
    end
  when '11'
    os_ver = '11'
    version '3.28.0'
    if arch == 'arm64'
      sha256 'nil'
    elsif arch == 'x86_64'
      sha256 '088bb90b9ef8e3d231f874174bd0e3f7366abb78ec21bd71e6083787a0392ecc'
    end
  else
    os_ver = '12'
    version '3.28.0'
    if arch == 'x86_64'
      sha256 '09499cb4309a1d522ec50fe8246180dcc0e1ff150818f17493e60bf3d6003dc3'
    elsif arch == 'arm64'
      sha256 'nil'
    end
  end

  depends_on macos: '>= :el_capitan'
  url "https://downloads.puppet.com/mac/puppet-tools/#{os_ver}/#{arch}/puppet-bolt-#{version}-1.osx#{os_ver}.dmg"
  pkg "puppet-bolt-#{version}-1-installer.pkg"

  name 'Puppet Bolt'
  homepage 'https://github.com/puppetlabs/bolt'

  bolt_bins = '/opt/puppetlabs/bolt/bin'
  caveats %Q(
    Puppet Bolt binaries are installed in #{bolt_bins}, which is sourced by an /etc/paths.d entry.
    #{bolt_bins} may not be included in your current $PATH but should be included in new shells.
  )

  uninstall pkgutil: 'com.puppetlabs.puppet-bolt'
end
