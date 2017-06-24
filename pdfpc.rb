class Pdfpc < Formula
  desc "Presenter console with multi-monitor support for PDF files."
  homepage "https://pdfpc.github.io/"
  head "https://github.com/pdfpc/pdfpc.git"

  stable do
    url "https://github.com/pdfpc/pdfpc/archive/v4.0.6.tar.gz"
    sha256 "42b6bd421e977a98cf00d688da7b392b8d8be423eb56ea7ca929c3c0334f8aa4"
    patch do
      # Fix for updated bindings in Vala 0.36
      url "https://github.com/pdfpc/pdfpc/commit/d9673035b8ce6863fac23a40397a2b642a4778eb.patch"
      sha256 "12017e656bc96b37668b5805bf75030a38828bd71050548e6366f11423426c04"
    end
  end

  depends_on "cmake" => :build
  depends_on "vala" => :build
  depends_on "gtk+3"
  depends_on "libgee"
  depends_on "poppler"
  depends_on "librsvg"
  depends_on "poppler"

  def install
    system "cmake", ".", "-DMOVIES=off", *std_cmake_args
    system "make", "install"
  end

  test do
    system "#{bin}/pdfpc", "--version"
  end
end
