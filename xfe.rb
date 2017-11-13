# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Xfe < Formula
  desc ""
  homepage ""
  url "https://n.ethz.ch/~kummerth/x-fe.tar.gz"
  #sha256 "59a1c8867f3b2f7cf166b158961ac539a30452c6720a3c143ed9b268a743999d"

  depends_on "cmake" => :build
  depends_on "eigen"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    ENV.cxx11
    args = std_cmake_args
    args += %w[-DCMAKE_CXX_FLAGS="-I/usr/local/opt/eigen/include/eigen3"]
    system "cmake", ".", *args
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test xFE`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
