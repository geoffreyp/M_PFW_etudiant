{ pkgs ? import <nixpkgs> {} }:
with pkgs;
stdenv.mkDerivation {
  name = "simple_scripts";
  src = ./.;
  buildInputs = [ python3 ];
  installPhase = ''
    mkdir -p $out
    cp data/* $out/
    '';
}
