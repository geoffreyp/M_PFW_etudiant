{ pkgs ? import <nixpkgs> {} }:

with pkgs;
stdenv.mkDerivation {
  name = "helloghc";
  src = ./.;
  buildInputs = [ ghc ];
  buildPhase = ''
    ghc -O2 -o helloghc.cgi helloghc.hs
    '';
  installPhase = ''
    mkdir $out
    mv helloghc.cgi $out
    '';
}


