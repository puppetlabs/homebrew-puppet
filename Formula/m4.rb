class M4 < Formula
  desc "Macro processing language"
  homepage "https://www.gnu.org/software/m4/"
  url "https://ftpmirror.gnu.org/m4/m4-1.4.21.tar.xz"
  mirror "https://ftp.gnu.org/gnu/m4/m4-1.4.21.tar.xz"
  mirror "http://ftp.gnu.org/gnu/m4/m4-1.4.21.tar.xz"
  sha256 "f25c6ab51548a73a75558742fb031e0625d6485fe5f9155949d6486a2408ab66"
  license "GPL-3.0-or-later"
  compatibility_version 1

  # Upstream bottles, mirrored internally. The sonoma bottle is poured on macOS 14 and newer Intel.
  bottle do
    root_url "https://artifactory.delivery.puppetlabs.net/artifactory/generic/buildsources/macos/homebrew"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "81e05b29593d5a7a5dc4fe5f245fc62623a84b82c67183bf26385cb86939c6d4"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "80f871ba39104ef553d5a15e2c70639c69dd4fb76568842f5dc1ef451918c6a8"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "72ca35bf13692b0dc9b3880170a0272e76c96f90e499dbbc6fb8a3765df1be31"
    sha256 cellar: :any_skip_relocation, tahoe:         "a7da5c29823df4a3c80723639e17153dc6fc71621d87cdc8f5e88f628764c816"
    sha256 cellar: :any_skip_relocation, sequoia:       "9956d5e742750c93d61a27ac209e7dfe7a6e0de2dfbc2ea73210741eb2e51461"
    sha256 cellar: :any_skip_relocation, sonoma:        "0cf6a1f36ee3fba3f5a68541cbea8bce737766b02a1805e211deef5b3b3867a6"
  end

  keg_only :provided_by_macos
end
