class Wash < Formula
  version = "0.5.0"
  homepage "https://puppetlabs.github.io/wash"
  url "https://github.com/puppetlabs/wash/archive/#{version}.tar.gz"
  sha256 "8a7524d0c84b0aaf5fd024450ab4b1a191338bdfeeb959b17fb7a583aa0866ff"

  head "https://github.com/puppetlabs/wash.git"

  depends_on "go" => [:build, "1.12.0"]

  def install
    system "go build -ldflags='-w -s -X github.com/puppetlabs/wash/cmd.version=#{version}'"
    bin.install "wash" => "wash"
  end

  test do
    system "#{bin}/wash", "help"
  end

  def caveats
    "Wash depends on libfuse. You can install it with `brew cask install osxfuse`."
  end
end
