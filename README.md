# nix-npm-overlay

This repository is a Nix overlay for NPM, PNPM, and Yarn. It is used in [Nixpacks](https://github.com/railwayapp/nixpacks).

Nix derivations for these package managers are automatically generated for the latest versions.

## Usage

```nix
{ pkgs ? import <nixpkgs> {} }:

let
  npmOverlay = import (builtins.fetchTarball "https://github.com/railwayapp/nix-npm-overlay/archive/main.tar.gz");
  pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz") {
    overlays = [ npmOverlay ];
  };
in
pkgs.buildEnv {
  name = "npm-overlay-env";
  paths = with pkgs; [
    nodejs_20
    pnpm-9_x
  ];
}
```
