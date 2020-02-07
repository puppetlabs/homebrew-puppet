cask 'pe-client-tools-2018.1' do
  case MacOS.version
  when '10.12'
    os_ver = '10.12'
    version '18.1.3'
    sha256 '63c114696d1fb7642b493fb7111d922582cfb37e497cb0258e6d836a19af644a'
  else
    os_ver = '10.13'
    version '18.1.3'
    sha256 '9413d45d322bb96fbd3073055ce01022907a37659a0005242f64f2da2d34e08b'
  end

  depends_on macos: '>= :sierra'
  url "https://pm.puppet.com/pe-client-tools/2018.1.0/#{version}/repos/apple/#{os_ver}/PC1/x86_64/pe-client-tools-#{version}-1.osx#{os_ver}.dmg"
  pkg "pe-client-tools-#{version}-1-installer.pkg"

  name 'PE Client Tools'
  homepage "https://puppet.com/docs/pe/2018.1/installing_pe_client_tools.html"

  uninstall pkgutil: 'com.puppetlabs.pe-client-tools'
end
