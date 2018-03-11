{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "make_img";
  src = ./.;
  buildInputs = [ 
    pkgs.python3Packages.pillow 
  ];
  installPhase = ''
    mkdir $out
    cp data/* $out/
    ln -s /tmp $out/tmp
  '';
}

