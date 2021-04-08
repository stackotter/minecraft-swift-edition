# Minecraft Delta Client - Changing the meaning of speed

## Overview

Delta Client is an open source rewrite of Minecraft Java Edition written in Swift (and a bit of C for performance).

In the future the project will support iOS and iPadOS and maybe AppleTV to allow playing on Java Edition on platforms normally limited to Bedrock Edition.

The focus of this project is to provide a significantly more performant Minecraft Java Edition compatible client for macOS (and one at all for iOS).

NOTE: I am NOT responsible for anti-cheat bans, the client has not been thoroughly tested yet and is still deep in development.

## Minecraft version support

- [ ] 1.8.9 (will come once 1.16.1 is pretty polished)
- [x] 1.16.1

## Metrics

Here's a list of the client's current numbers when run on my 2020 dual-core Intel i5 MacBook Air with 8gb of ram;

- launch time: 0.85s avg
  - vanilla minecraft: 40s (47x slower)
- first launch time: 35s avg
  - highly dependent on internet speed
- ram usage on home screen: 40mb avg
  - about the same as vanilla minecraft
- ram usage in game: just under 100mb
- time taken to join server: 1s
  - vanilla minecraft takes around 2-3s
  - Delta Client currently only renders one chunk so it's a pretty unfair comparison anyway
- app size: 14.5mb
  - i currently only use two external libraries; Zip (for extracting assets from the client jar) and SwiftProtobuf (for caching)
  - i may make my own fork of Zip to only include what i need but in comparison to SwiftProtobuf (which is pretty small anyway) it's tiny so it's probably not that worth it

## Features

- [ ] Networking
  - [x] Basic networking
  - [x] Server list ping
  - [x] Encryption (for non-offline mode servers)
    - [x] Mojang accounts
    - [ ] Microsoft accounts
  - [ ] LAN servers
- [x] Basic config system
- [ ] Command-based interface
  - [x] Basic structure
  - [x] Chat command
  - [x] Tab list command
  - [ ] Action commands
  - [ ] Movement commands
- [ ] Rendering
  - [ ] Chunks
    - [x] Basic block rendering
    - [x] Basic chunk rendering
    - [x] Block culling
    - [x] Block models
    - [ ] Multiple chunks
    - [ ] Animated textures
    - [ ] Block entities
    - [ ] Chunk culling
  - [ ] HUD
    - [ ] Basic text
    - [ ] Chat
    - [ ] F3-style stuff
    - [ ] Bossbars
    - [ ] Scoreboard
    - [ ] Health, hunger and experience
  - [ ] Items
  - [ ] Entities
    - [ ] Basic entity rendering (just coloured cubes)
    - [ ] Render entity models
    - [ ] Entity animations
  - [ ] Particles
    - [ ] Basic particle system
    - [ ] Block break particles
    - [ ] Ambient particles
    - [ ] Hit particles
    - [ ] Particles from server
  - [ ] GUI
    - [ ] Hotbar
    - [ ] Inventory
      - [ ] Basic inventory
      - [ ] Basic crafting
      - [ ] Inventory actions
      - [ ] Using recipe blocks (like crafting tables and stuff)
      - [ ] Creative inventory
- [ ] Sound
  - [ ] Basic sounds system

## Command Interface

Currently the client gives you the option to join a world in commands mode.

These are NOT commands in the traditional minecraft sense (e.g. ```/kill``` and ```/time set day```). They are basic commands that let you interact with the server.

More commands will probably be added later.

Actually, I might just disable these soon, they're pretty useless.

#### Current Commands

- ```say [message]```
  - sends a message in chat
- ```swing [mainhand|offhand]```
  - causes the player's arm to swing. can be used to say hi to other players :) (and also just to test if it's working)
- ```tablist```
  - lists players in tab list
- ```getblock [x] [y] [z]```
  - gets the block state id of the block at position

## Screenshots

#### Server list

![alt text](https://github.com/stackotter/minecraft-swift-edition/blob/main/screenshots/server-list.png?raw=true)

#### Edit Server List

![alt text](https://github.com/stackotter/minecraft-swift-edition/blob/main/screenshots/edit-server-list.png?raw=true)

#### Current rendering

Rendering multiple chunks is coming next.

![alt text](https://github.com/stackotter/minecraft-swift-edition/blob/main/screenshots/rendering/progress-5.png?raw=true)

#### The same place but in vanilla Minecraft

![alt text](https://github.com/stackotter/minecraft-swift-edition/blob/main/screenshots/rendering/progress-5-vanilla.png?raw=true)
