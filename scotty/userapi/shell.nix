with import <nixpkgs>{};
(haskellPackages.callPackage ./userapi.nix {}).env

