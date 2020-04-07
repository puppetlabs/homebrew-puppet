class Relay < Formula
  version "v3.4.0"
  homepage "https://relay.sh/"
  url "https://github.com/puppetlabs/relay/releases/download/#{version}/nebula-#{version}-darwin-amd64", 
    :using => :nounzip
  sha256 "2b43e3deb12c6ad2449abcb85ca095cbefd8d6c35c98b3987986d43c7b375916"

  def install
    bin.install "nebula-#{version}-darwin-amd64" => "relay"
  end

  test do
    system "#{bin}/relay", "help"
  end

end
