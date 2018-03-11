{ pkgs ? import <nixpkgs> {} }:

let 
  _helloghc = import ./helloghc/default.nix { inherit pkgs; };
  _hellocabal = import ./hellocabal/default.nix { inherit pkgs; };
in

pkgs.stdenv.mkDerivation {
  name = "hellohs";
  src = ./.;
  buildInputs = [ _helloghc _hellocabal ];
  installPhase = ''
    mkdir $out
    cp data/* $out
    cp ${_helloghc}/* $out
    cp ${_hellocabal}/bin/* $out
  '';
}

