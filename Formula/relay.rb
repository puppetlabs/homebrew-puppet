class Relay < Formula
  version "v5.0.0"
  homepage "https://relay.sh/"
  url "https://github.com/puppetlabs/relay/releases/download/#{version}/relay-#{version}-darwin-amd64", 
    :using => :nounzip
  sha256 "e1b8fa72f22ed94932aeab647c7594040844c8a110eb7e2af6a68e9ce9dd88a0"

  def install
    bin.install "relay-#{version}-darwin-amd64" => "relay"
  end

  test do
    system "#{bin}/relay", "help"
  end

end
