# KeyBridge

Unified ergonomic MacOS-like bindings for GNU Linux and MS Windows

Currently Ubuntu 24.04 and Windows 11 tested

## Motivation

- unification and similar experience
- most ergonomic keys, taking best from all systems
- learn once, use everywhere
- easy to setup
- to use [xremap](https://github.com/xremap/xremap) instead of [xkeysnail](https://github.com/mooz/xkeysnail)/[keyszer](https://github.com/joshgoebel/keyszer)

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
- install [this](https://extensions.gnome.org/extension/5060/xremap/) Gnome extension if use Gnome
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

# setup system wshortcuts to ensure compatibility
bash ~/.config/keybridge/pre-setup-linux.sh

# enable service
systemctl enable --now --user xremap
```

### Windows setup

- install [autohotkey v2](https://www.autohotkey.com/v2/)
- download ahkv2 config named [windows.ahk](./windows.ahk)
- place config to `shell:startup` and run it

```powershell
# install keymapping software

# add to autorun

# run

```

## To do

- [ ] systemd service for xremap
- [ ] setup scripts
- [ ] more linux desktops support
- [ ] smarter xremap Installation
- [ ] windows switch desktops by numbers
- [ ] more detailed readme: analysis description
