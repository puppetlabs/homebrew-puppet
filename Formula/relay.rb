class Relay < Formula
  version "v4.0.4"
  homepage "https://relay.sh/"
  url "https://github.com/puppetlabs/relay/releases/download/#{version}/nebula-#{version}-darwin-amd64", 
    :using => :nounzip
  sha256 "758d53d68aa161f0f7cfd075a38413d047c47e6e0c40269a096b139bee7789f1"

  def install
    bin.install "nebula-#{version}-darwin-amd64" => "relay"
  end

  test do
    system "#{bin}/relay", "help"
  end

end
