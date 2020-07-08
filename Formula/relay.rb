class Relay < Formula
  version "v4.1.1"
  homepage "https://relay.sh/"
  url "https://github.com/puppetlabs/relay/releases/download/#{version}/relay-#{version}-darwin-amd64", 
    :using => :nounzip
  sha256 "6abdf72663915fab350155cd00a385c9532bfb95962af33a2cc853a622a332b4"

  def install
    bin.install "relay-#{version}-darwin-amd64" => "relay"
  end

  test do
    system "#{bin}/relay", "help"
  end

end
