class ExcalidrawCli < Formula
  desc "CLI for creating Excalidraw flowcharts programmatically"
  homepage "https://github.com/swiftlysingh/excalidraw-cli"
  url "https://registry.npmjs.org/@swiftlysingh/excalidraw-cli/-/excalidraw-cli-1.4.0.tgz"
  sha256 "2f95f839017870f8533027ed9747901161c90109179aa4c312227ab9a4b5ecf9"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
    man1.install "man/excalidraw-cli.1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/excalidraw-cli --version")
    system bin/"excalidraw-cli", "create", "--inline", "[A] -> [B]", "-o", "flow.excalidraw"
    assert_equal "excalidraw", JSON.parse((testpath/"flow.excalidraw").read).fetch("type")
    system bin/"excalidraw-cli", "convert", "flow.excalidraw", "--format", "svg"
    assert_match "<svg", (testpath/"flow.svg").read
    system bin/"excalidraw-cli", "convert", "flow.excalidraw", "--format", "png"
    assert_equal "\x89PNG\r\n\x1a\n".b, (testpath/"flow.png").binread[0, 8]
  end
end
