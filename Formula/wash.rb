class Wash < Formula
  version = "0.23.2"
  homepage "https://puppetlabs.github.io/wash"
  url "https://github.com/puppetlabs/wash/archive/#{version}.tar.gz"
  sha256 "b55233d2e0edf3dd7379f8fe66559646e7348224eb382480bc79a744cc812088"

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
    "Wash depends on libfuse. You can install it with `brew install osxfuse`."
  end
end
