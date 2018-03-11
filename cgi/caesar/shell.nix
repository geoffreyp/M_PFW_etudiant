{ pkgs ? import <nixpkgs> {} }:
(pkgs.haskellPackages.callPackage ./caesar.nix {}).env

