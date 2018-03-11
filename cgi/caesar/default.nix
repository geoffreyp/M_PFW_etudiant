{ pkgs ? import <nixpkgs> {} }:

let 
  _caesar = pkgs.haskellPackages.callPackage ./caesar.nix {};
in

pkgs.stdenv.mkDerivation {
  name = "caesar";
  src = ./.;
  buildInputs = [ _caesar ];
  installPhase = ''
    mkdir $out
    cp data/* $out/
    cp ${_caesar}/bin/*.cgi $out/
  '';
}

