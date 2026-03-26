class DtachRev < Formula
  desc "Detach/reattach terminal sessions with scrollback buffer and idle callbacks"
  homepage "https://github.com/bmills23/dtach-rev"
  url "https://github.com/bmills23/dtach-rev/archive/refs/tags/v0.9.6.tar.gz"
  sha256 "98fb7a32f3819c370be962a0c36f2784559d707f94e23a77630f21096a902725"
  license "GPL-2.0-or-later"

  conflicts_with "dtach", because: "both install a `dtach` binary"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    bin.install "dtach"
    man1.install "dtach.1"
  end

  test do
    assert_match "scrollback", shell_output("#{bin}/dtach --help 2>&1", 0)
  end
end
