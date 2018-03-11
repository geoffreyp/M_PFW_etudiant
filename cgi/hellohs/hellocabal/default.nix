{ pkgs ? import <nixpkgs> {} }:
pkgs.haskellPackages.callPackage ./hellocabal.nix {}

