class Pkgconf < Formula
  desc "Package compiler and linker metadata toolkit"
  homepage "https://github.com/pkgconf/pkgconf"
  url "https://distfiles.ariadne.space/pkgconf/pkgconf-3.0.6.tar.xz"
  mirror "https://github.com/pkgconf/pkgconf/releases/download/pkgconf-3.0.6/pkgconf-3.0.6.tar.xz"
  mirror "http://fresh-center.net/linux/misc/pkgconf-3.0.6.tar.xz"
  sha256 "c88a653fbabfa2a5857a30f6b6ad6c40dbacc3b7c72cc066e5c7dc4571cbddaa"
  license "ISC"
  compatibility_version 2

  # Upstream bottles, mirrored internally. 3.0.6 is the last version with macOS Intel bottles.
  bottle do
    root_url "https://artifactory.delivery.puppetlabs.net/artifactory/generic/buildsources/macos/homebrew"
    rebuild 1
    sha256 arm64_tahoe:   "fb0d6f455349a08a10b83119670d2dd5750ce5b22ad88f9b9688467b2c50ce05"
    sha256 arm64_sequoia: "ec4fd0c30334ce21edbbc503a82e8ce73dd127532d6021d1d703c38c74ce1be6"
    sha256 arm64_sonoma:  "5d55ff53bb261627ad63d35d9d61f04b8dc031e31f406a1d6353c06462c0e9be"
    sha256 tahoe:         "40fb47fa0bcd78d5bcf13a879e2cab737c13b8bef11ba0d7613c839c2b8a4c35"
    sha256 sequoia:       "d73a945d9dc05067f6b4a11f8f6cab1a6f0dcff5e8dee0ee07b4dd40d7830262"
    sha256 sonoma:        "39cae29fa7487c6ebdd0763764543b242e76e2a0f1013e3f31dcd5a39fe00390"
  end
end
