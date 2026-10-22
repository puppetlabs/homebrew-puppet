class Autoconf < Formula
  desc "Automatic configure script builder"
  homepage "https://www.gnu.org/software/autoconf/"
  url "https://ftpmirror.gnu.org/autoconf/autoconf-2.73.tar.gz"
  mirror "https://ftp.gnu.org/gnu/autoconf/autoconf-2.73.tar.gz"
  sha256 "259ddfa3bddc799cfb81489cc0f17dfdf1bd6d1505dda53c0f45ff60d6a4f9a7"
  license all_of: [
    "GPL-3.0-or-later",
    "GPL-3.0-or-later" => { with: "Autoconf-exception-3.0" },
  ]
  compatibility_version 1

  # Upstream bottles, mirrored internally. The bottle is the same file for every macOS tag.
  bottle do
    root_url "https://artifactory.delivery.puppetlabs.net/artifactory/generic/buildsources/macos/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "bc785e044f4bec3efa3e9875f154905dad8a249e6e57d2a3ab0250eebdc866e8"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "bc785e044f4bec3efa3e9875f154905dad8a249e6e57d2a3ab0250eebdc866e8"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "bc785e044f4bec3efa3e9875f154905dad8a249e6e57d2a3ab0250eebdc866e8"
    sha256 cellar: :any_skip_relocation, tahoe:         "bc785e044f4bec3efa3e9875f154905dad8a249e6e57d2a3ab0250eebdc866e8"
    sha256 cellar: :any_skip_relocation, sequoia:       "bc785e044f4bec3efa3e9875f154905dad8a249e6e57d2a3ab0250eebdc866e8"
    sha256 cellar: :any_skip_relocation, sonoma:        "bc785e044f4bec3efa3e9875f154905dad8a249e6e57d2a3ab0250eebdc866e8"
  end

  depends_on "puppetlabs/puppet/m4"

  uses_from_macos "perl"
end
