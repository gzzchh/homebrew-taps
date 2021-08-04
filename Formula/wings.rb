class WingsCn < Formula
  desc "Pterodactyl Wings"
  homepage ""
  url "https://release-mirror-1251511762.cos.ap-guangzhou.myqcloud.com/pterodactyl/wings/v1.4.5/wings_linux_amd64"
  sha256 "95cc085c7e215343f5ea6511a058babd905b675725dbd405a8a755dd725da11c"
  license "MIT"

  class CheckUpdate
    @type = "github"
  end

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "./configure", *std_configure_args, "--disable-silent-rules"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test wings_linux_amd`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
