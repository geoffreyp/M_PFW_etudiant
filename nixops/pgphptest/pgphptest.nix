{ pkgs ? import <nixpkgs> {} } :

with pkgs;
stdenv.mkDerivation {
  name = "pgphptest";
  src = ./.;
  installPhase = ''
    mkdir -p $out
    cp -r data/* $out
  '';
}

