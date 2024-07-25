class Relay < Formula
  version "v5.2.0"
  homepage "https://relay.sh/"
  url "https://github.com/puppetlabs/relay/releases/download/#{version}/relay-#{version}-darwin-amd64", 
    :using => :nounzip
  sha256 "ad75452b15b2c02dd6f16f45ed7c41a181cabb7f51232fd5a34ff757af12a85f"

  deprecate! date: "2024-07-25", because: :repo_archived

  def install
    bin.install "relay-#{version}-darwin-amd64" => "relay"
  end

  test do
    system "#{bin}/relay", "help"
  end

end
