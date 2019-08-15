class Wash < Formula
  version = "0.8.0"
  homepage "https://puppetlabs.github.io/wash"
  url "https://github.com/puppetlabs/wash/archive/#{version}.tar.gz"
  sha256 "3d6250c928027faab8c5a2e4ef19765378c64b7031e54680ea9c43465faa9be5"

  head "https://github.com/puppetlabs/wash.git"

  depends_on "go" => [:build, "1.12.0"]

  def install
    system "go build -ldflags='-w -s -X github.com/puppetlabs/wash/cmd/version.BuildVersion=#{version}'"
    bin.install "wash" => "wash"
  end

  test do
    system "#{bin}/wash", "help"
  end

  def caveats
    "Wash depends on libfuse. You can install it with `brew cask install osxfuse`."
  end
end
