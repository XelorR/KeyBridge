# KeyBridge

Unified ergonomic MacOS-like bindings for GNU Linux and MS Windows

Currently Ubuntu 24.04 and Windows 11 tested

## Motivation

- unification and similar experience
- most ergonomic keys, taking best from all systems
- learn once, use everywhere
- easy to setup
- to use [xremap](https://github.com/xremap/xremap) instead of [xkeysnail](https://github.com/mooz/xkeysnail)/[keyszer](https://github.com/joshgoebel/keyszer)
- minimize conflicts with OS shortcuts

## Analysis

- edition keys...
- tab switching...
- common modifier-letter keys...
- multitasking...
- window management...
- capslock...
- file manaher operations..

## Similar projects

I am familiar with two similar projects

- [Kinto](https://kinto.sh)
- [Toshy](https://github.com/RedBearAK/toshy)

Both have following issues:

- no multitasking / workspace control mappings
- modifier swap for _some_ apps which breaks general OS functionality

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
systemctl enable --now --user xremap
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
