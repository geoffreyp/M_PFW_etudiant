{ pkgs ? import <nixpkgs> {} }:

let 
  _echows = pkgs.haskellPackages.callPackage ./echows.nix {};
in

pkgs.stdenv.mkDerivation {
  name = "echows";
  src = ./.;
  buildInputs = [ _echows ];
  installPhase = ''
    mkdir $out
    cp -r client $out/
    cp ${_echows}/bin/echows $out/
  '';
}

