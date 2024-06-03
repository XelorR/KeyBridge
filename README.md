# KeyBridge

Unified ergonomic MacOS-like bindings for GNU Linux and MS windows

## Focus

OS:

- Gnome, Wayland (Ubuntu 24.04 perfectly fits)
- Windows 11

Functionality:

- Common keys (⌘-letters)
- Tab navigation with ⇧⌘] / ⇧⌘[
- Multitasking, Mission Control and workspaces
- Emacs-like editing
- [Rectangle](https://rectangleapp.com/)-like window snap left/right and maximize
- File manager operations
- VSCode (done) and JetBrains IDE (to do)
- Non-conflicting bindings, trying to keep native functionality when possible

Decided to implement differently:

- Make screenshot like on Windows (win+shift+s / ⇧⌥s)
- Move windows when possible (not available on MacOS)
- More Emacs-like keys for some apps
- CapsLock is additional Escape

> As it may work on wide range of desktops and configurations, supporting both Wayland and X11, I am still focusing on supporting only two most popular systems: **Gnome (Wayland)** and **Windows 11**.

## Motivation

- unification and similar experience on Mac/Linux/Windows
- easy to setup
- minimize conflicts with OS shortcuts
- use [xremap](https://github.com/xremap/xremap) instead of [xkeysnail](https://github.com/mooz/xkeysnail)/[keyszer](https://github.com/joshgoebel/keyszer)

## Analysis

Why I took mostly MacOS-like approach instead of Linux/Windows

- it is more fun to remap with [xremap](https://github.com/xremap/xremap) or [autohotkey](https://www.autohotkey.com/v2/), than with [karabiner](https://karabiner-elements.pqrs.org/)
- most of macos shortcuts are more ergonomic and less conflicting with posix programs
  - common modifier-letter keys - ⌘ is easier to reach than ctrl
  - edition keys - using ⌘ allow us to bind emacs-like keys without much conflict
  - tab switching - ⇧⌘] / ⇧⌘[ are reachable from home row, unlike ctrl-pgup or ctrl-tab
  - multitasking - one ctrl key to rule them all. And it is not conflicting with other keys
  - window management - taking Rectangle approach because it is easy to get on mac and it has nice defaults and it's easy to replicaye it on other systems
  - file manager operations
    - ⌘-arrows to navigation and opening files is very natural when you use to it
    - enter to rename is a good idea because can be used from home row
    - ⌘-backspace is easier to reach than delete
  - capslock is useless, let it be one more Escape, reachable from home row

## Similar projects

I am familiar with two similar projects

- [Kinto](https://kinto.sh)
- [Toshy](https://github.com/RedBearAK/toshy)

Both have following issues:

- no multitasking / workspace control mappings
- modifier swap for _some_ apps which breaks general OS functionality
- focusing on wide range of desktop environments which require some trade-offs, force to avoid some features and increasing complexity

## Installation

### Linux setup

- [install](./install-xremap.sh) [xremap](https://github.com/xremap/xremap)
- install [this](https://extensions.gnome.org/extension/5060/xremap/) **Gnome extension** if use Gnome
- run [pre-setup script](./pre-setup-linux.sh)
- download xremap config named [linux.yml](./linux.yml)
- add xremap with config to autorun

```bash
#!/bin/bash

# get repo
mkdir -p ~/.config
git clone https://github.com/XelorR/KeyBridge ~/.config/keybridge

# install keymapping software
bash ~/.config/keybridge/install-xremap.sh

# setup system shortcuts to ensure compatibility
bash ~/.config/keybridge/pre-setup-linux.sh

# enable service
systemctl enable --now --user keybridge
```

If you use [VSCodium](https://vscodium.com/) or [VSCode](https://code.visualstudio.com/), you should also disable Alt focusing to menu bar:

![disable alt in vscode](./assets/vscode-disable-alt-focus-menu-bar.png)

### Windows setup

- install [autohotkey v2](https://www.autohotkey.com/v2/)
- download ahkv2 config named [windows.ahk](./windows.ahk)
- place config to `shell:startup` and run it

```powershell
# install package manager
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# install keymapping software
scoop install git
scoop bucket add extras
scoop install autohotkey

# download the config
git clone https://github.com/XelorR/KeyBridge $env:LOCALAPPDATA/keybridge

# add to autorun
...

# run
...
```

## To do

- [x] systemd service for xremap
- [ ] setup scripts
- [ ] more linux desktops support
- [ ] smarter xremap Installation
- [ ] windows switch desktops by numbers
- [ ] more detailed readme: analysis description
- [ ] xremap installer compatibility with arm64
