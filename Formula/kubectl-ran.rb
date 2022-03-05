class KubectlRan < Formula
  version "v0.1.2"
  homepage "https://github.com/puppetlabs/kubectl-ran"
  url "https://github.com/puppetlabs/kubectl-ran/releases/download/#{version}/kubectl-ran_#{version.to_s()[1..-1]}_Darwin_x86_64.tar.gz"
  sha256 "b5e924d0e6cabfbc227c65a18ef10737dce72180ef925c00e9345ff301d7f2c0"

  def install
    bin.install "kubectl-ran" => "kubectl-ran"
  end

  test do
    system "#{bin}/kubectl-ran"
  end

end
