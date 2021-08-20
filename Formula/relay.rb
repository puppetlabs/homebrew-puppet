class Relay < Formula
  version "v4.8.0"
  homepage "https://relay.sh/"
  url "https://github.com/puppetlabs/relay/releases/download/#{version}/relay-#{version}-darwin-amd64", 
    :using => :nounzip
  sha256 "e40869bfe2c9284c09735f9a487abc4a10c5c0de712e1c00d59627b3d005f35b"

  def install
    bin.install "relay-#{version}-darwin-amd64" => "relay"
  end

  test do
    system "#{bin}/relay", "help"
  end

end
