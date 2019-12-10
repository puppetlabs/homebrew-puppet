class Wash < Formula
  version = "0.16.0"
  homepage "https://puppetlabs.github.io/wash"
  url "https://github.com/puppetlabs/wash/archive/#{version}.tar.gz"
  sha256 "00d8c3a15ad8d069c96feb4ce7e0f1700f3665712770d03e59adf52ce2d78a15"

  head "https://github.com/puppetlabs/wash.git"

  depends_on "go" => [:build, "1.12.0"]
  option "with-coreutils", "Enables relative paths in the shell prompt using realpath"
  depends_on "coreutils" => :recommended

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
