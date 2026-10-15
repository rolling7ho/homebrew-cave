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

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
