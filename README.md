# rolling7ho/cave

This repository hosts the Homebrew tap for [cave-vm](https://github.com/rolling7ho/cave-vm): fast, disposable Linux VMs for coding agents on Apple Silicon Macs with macOS 26 or later.

## Install

```sh
brew install rolling7ho/cave/cave-vm
```

## Use

```sh
cd [project-dir]
cave run
```

To use coding agents:
```sh
cave agent [claude/codex]
```

## Upgrade

```sh
brew update
brew upgrade cave-vm
```

## Uninstall

```sh
cave stop --force
brew uninstall cave-vm
brew untap rolling7ho/cave
```

`cave stop --force` stops every VM **without saving it**. 
Run `cave stop` in each project first if you want to keep their state.

Data is located here:

- `~/Library/Application Support/cave-vm/` holds the kernels and base images and cave's SSH key.
- Each project's `.cave/` folder holds its VM's disk and snapshots. Deleting it deletes any work that is only in the VM.
- `~/.ssh/config` has an `Include` line for cave's SSH hosts, added if you used `cave ssh`. Delete that line.

## License

Apache 2.0. See [LICENSE](LICENSE).
