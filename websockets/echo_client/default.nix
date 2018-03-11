{ pkgs ? import <nixpkgs> {} }:
pkgs.haskellPackages.callPackage ./app.nix {}

