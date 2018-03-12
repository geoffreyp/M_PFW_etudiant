{ pkgs ? import <nixpkgs> {} }:

let 
  _musicws = pkgs.haskellPackages.callPackage ./musicws.nix {};
in

pkgs.stdenv.mkDerivation {
  name = "musicws";
  src = ./.;
  buildInputs = [ _musicws ];
  installPhase = ''
    mkdir $out
    cp data/* $out/
    cp ${_musicws}/bin/musicws $out/
  '';
}

