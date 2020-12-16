class Relay < Formula
  version "v4.3.2"
  homepage "https://relay.sh/"
  url "https://github.com/puppetlabs/relay/releases/download/#{version}/relay-#{version}-darwin-amd64", 
    :using => :nounzip
  sha256 "937bb5ba5c5a829eda1c8d419942160ee9baff01f31b614fddb6457ece3b02bd"

  def install
    bin.install "relay-#{version}-darwin-amd64" => "relay"
  end

  test do
    system "#{bin}/relay", "help"
  end

end
