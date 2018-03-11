{ pkgs ? import <nixpkgs> {} }:

let 
  _music = pkgs.haskellPackages.callPackage ./music.nix {};
in

pkgs.stdenv.mkDerivation {
  name = "music-webserver";
  src = ./.;
  buildInputs = [ _music ];
  installPhase = ''
    mkdir $out
    cp ${_music}/bin/*.cgi $out/
    cp data/index.html $out/
    cp data/music.sql $out/
  '';
}

