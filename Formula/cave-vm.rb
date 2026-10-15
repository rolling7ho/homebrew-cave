class CaveVm < Formula
  desc "Fast, disposable Linux VMs for coding agents on macOS"
  homepage "https://github.com/rolling7ho/cave-vm"
  url "https://github.com/rolling7ho/cave-vm/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "422beb1226a565d0dd185d4c15b4f66a8f3ab3db099fccaee9cbe3dfc89cf60a"
  license "Apache-2.0"
  head "https://github.com/rolling7ho/cave-vm.git", branch: "main"

  depends_on "rust" => :build
  depends_on arch: :arm64
  depends_on macos: :tahoe

  def fetch
    system "cargo", "fetch", *std_cargo_fetch_args
  end

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/cli")
    system "cargo", "install", *std_cargo_args(path: "crates/daemon")
    system "cargo", "install", "--bin", "cave-vmm", *std_cargo_args(path: "crates/vmm")
    # Hypervisor.framework needs this entitlement. The signature is ad hoc,
    # made on this Mac; cave also re-signs cave-vmm on first run if needed.
    system "/usr/bin/codesign", "--sign", "-", "--force",
           "--entitlements", "scripts/hypervisor.entitlements", bin/"cave-vmm"
  end

  def caveats
    <<~EOS
      Set up a project and start its VM:
        cd my-project && cave run
      The first run downloads the kernel and a Debian image (about 2 GB).
      `cave doctor` checks the setup.
    EOS
  end

  test do
    entitlements = shell_output("/usr/bin/codesign -d --entitlements - --xml #{bin}/cave-vmm 2>&1")
    assert_match "com.apple.security.hypervisor", entitlements

    (testpath/"proj").mkpath
    cd testpath/"proj" do
      system bin/"cave", "init", "--sealed"
      assert_match 'image   = "base"', (testpath/"proj/cave.toml").read
    end
  end
end
