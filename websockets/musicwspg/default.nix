{ pkgs ? import <nixpkgs> {} }:

let 
  _musicwspg = pkgs.haskellPackages.callPackage ./musicwspg.nix {};
in

pkgs.stdenv.mkDerivation {
  name = "musicwspg";
  src = ./.;
  buildInputs = [ _musicwspg ];
  installPhase = ''
    mkdir $out
    cp data/* $out/
    cp ${_musicwspg}/bin/musicwspg $out/
  '';
}

