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
- run [pre-setup script](./pre-setup-linux.sh)
- download xremap config named [linux.yml](./linux.yml)
- add xremap with config to autorun

### Windows setup

- install [autohotkey v2](https://www.autohotkey.com/v2/)
- download ahkv2 config named [windows.ahk](./windows.ahk)
- place config to `shell:startup` and run it

## To do

- [ ] systemd service for xremap
- [ ] setup scripts
- [ ] more linux desktop support
- [ ] windows switch desktops by numbers
- [ ] more detailed readme: analysis description
