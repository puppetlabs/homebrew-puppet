cask 'pe-client-tools-2019.8' do
  case MacOS.version
  when '10.13'
    os_ver = '10.13'
    version '19.8.4'
    sha256 '2c47f8ef4789d1cdf52d4b9d1e9d8e333101286117ab27bf6b9659929a7776fa'
  when '10.14'
    os_ver = '10.14'
    version '19.8.4'
    sha256 '1256319f55863af4ca8afb0eb3939e247a18104f5a0fd4cd4b59146487d99ca1'
  else
    os_ver = '10.15'
    version '19.8.4'
    sha256 '41b83875ff013d3e6dc91f59b49708d4076666e619d010c7cbce4f5412d0e3fa'
  end

  depends_on macos: '>= :high_sierra'
  url "https://pm.puppet.com/pe-client-tools/2019.8.0/#{version}/repos/apple/#{os_ver}/PC1/x86_64/pe-client-tools-#{version}-1.osx#{os_ver}.dmg"
  pkg "pe-client-tools-#{version}-1-installer.pkg"

  name 'PE Client Tools'
  homepage "https://puppet.com/docs/pe/2019.8/installing_pe_client_tools.html"

  uninstall pkgutil: 'com.puppetlabs.pe-client-tools'
end
