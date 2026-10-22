class Automake < Formula
  desc "Tool for generating GNU Standards-compliant Makefiles"
  homepage "https://www.gnu.org/software/automake/"
  url "https://ftpmirror.gnu.org/automake/automake-1.19.tar.xz"
  mirror "https://ftp.gnu.org/gnu/automake/automake-1.19.tar.xz"
  sha256 "e3e2c2e3abf37898138db5b6c1d1dc35c9160c5978be7947d2c741705251d445"
  license "GPL-2.0-or-later"
  compatibility_version 1

  # No bottle: homebrew-core has no macOS Intel bottle for automake 1.19, so this
  # is built from source. It takes about 20 seconds.

  depends_on "puppetlabs/puppet/autoconf"

  def install
    ENV["PERL"] = "/usr/bin/perl" if OS.mac?

    # We specify `HOMEBREW_PREFIX` so that aclocal is compiled with the
    # correct system value for acdir (`HOMEBREW_PREFIX/share/aclocal`)
    # We also patch `configure` so that the normal installation prefix
    # is used when we call `make install`
    inreplace "configure", "${datadir}", "${datarootdir}"
    system "./configure", "--sysconfdir=#{etc}",
                          "--localstatedir=#{var}",
                          "--datarootdir=#{share}",
                          "--datadir=#{HOMEBREW_PREFIX}/share",
                          *std_configure_args
    system "make", "install"

    # Use dirlist to add common search dirs for aclocal
    (share/"aclocal/dirlist").write <<~EOS
      /usr/share/aclocal
    EOS
  end
end
