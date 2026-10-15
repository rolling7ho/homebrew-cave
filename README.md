# rolling7ho/cave

The Homebrew tap for [cave-vm](https://github.com/rolling7ho/cave-vm): fast, disposable Linux VMs for coding agents on Apple Silicon Macs with macOS 26 or later.

## Install

```sh
brew install rolling7ho/cave/cave-vm
```

Or tap first, then install by name:

```sh
brew tap rolling7ho/cave
brew install cave-vm
```

The formula builds cave from the tagged source and signs `cave-vmm` ad hoc with the Hypervisor.framework entitlement on your Mac. No Apple account or certificate is involved.

## Use

```sh
cd my-project && cave run
```

The first run downloads the kernel and a Debian image from the cave-vm release. `cave doctor` checks the setup. See the [cave-vm README](https://github.com/rolling7ho/cave-vm#readme) for the rest.

## Upgrade

```sh
brew update && brew upgrade cave-vm
```

cave also asks before a command when a newer release is out, and runs these for you if you say yes. VMs that are running keep the old daemon until they stop, so run `cave stop` in those projects to switch them over.

## Uninstall

```sh
cave stop --force
brew uninstall cave-vm
brew untap rolling7ho/cave
```

`cave stop --force` stops every VM without saving it. Run `cave stop` in each project first if you want to keep their state.

That leaves your data, so a reinstall picks up where you were. To remove it too:

- `~/Library/Application Support/cave-vm/` holds the kernels and base images (about 2 GB each) and cave's SSH key.
- Each project's `.cave/` folder holds its VM's disk and snapshots. Deleting it deletes any work that is only in the VM.
- `~/.ssh/config` has an `Include` line for cave's SSH hosts, added if you used `cave ssh`. Delete that line.

## License

Apache 2.0, the same as cave-vm. See [LICENSE](LICENSE).

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
