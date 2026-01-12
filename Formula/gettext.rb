class Gettext < Formula
  desc "GNU internationalization (i18n) and localization (l10n) library"
  homepage "https://www.gnu.org/software/gettext/"
  url "https://ftpmirror.gnu.org/gnu/gettext/gettext-0.26.tar.gz"
  mirror "https://ftp.gnu.org/gnu/gettext/gettext-0.26.tar.gz"
  mirror "http://ftp.gnu.org/gnu/gettext/gettext-0.26.tar.gz"
  sha256 "39acf4b0371e9b110b60005562aace5b3631fed9b1bb9ecccfc7f56e58bb1d7f"
  license all_of: [
    "GPL-3.0-or-later",
    "LGPL-2.1-or-later", # libintl, libasprintf
  ]

  bottle do
    sha256 arm64_tahoe:   "f1a3876bef27aa262949baa369395e4b9312845f79b86860124773ec6eef8608"
    sha256 arm64_sequoia: "b25ac1e62443f8f79eadc3dadf6d3af954d4cbc33a0577fc626aa0c8f2bb01a5"
    sha256 arm64_sonoma:  "1615e931a23c6875c9bcae0ffccf5a4a35f796fb90b7192804c771cb25d766e2"
    sha256 arm64_ventura: "c9cf89dc04f56eb4939b00eea3c0361cd4498f8237e527f2f741682bf7e6de61"
    sha256 sonoma:        "87ac92958d68cfd4c000879302cc8237f9ab38aec9429c6970b31667c3d53870"
    sha256 ventura:       "36da5ebc7064150238eb5fd4c9640ee9ef2482cabb9707357d0ab7b198bf9c4f"
    sha256 arm64_linux:   "65da5d3da37d8ac70048648ec6c0680d5c22f9f55b4452a61374c8c267d1990f"
    sha256 x86_64_linux:  "fce5e0fea8441a729599191161a94a03ce4328e5c7a276df4ec322ff5e92958f"
  end

  depends_on "libunistring"

  uses_from_macos "libxml2"
  uses_from_macos "ncurses"

  on_linux do
    depends_on "acl"
  end
end
