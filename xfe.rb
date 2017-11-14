class Xfe < Formula
  desc "Finite element library written in C++"
  homepage "https://n.ethz.ch/~kummerth"
  url "https://n.ethz.ch/~kummerth/xfe.tar.gz"
  version "1.02"
  # sha256 ""

  depends_on "cmake" => :build

  def install
    ENV.cxx11
    args = std_cmake_args
    args += %w[-DCMAKE_CXX_FLAGS="-I/usr/local/opt/eigen/include/eigen3"]
    system "cmake", ".", *args
    system "make", "install"
  end

  test do
    # system "false"
  end
end
