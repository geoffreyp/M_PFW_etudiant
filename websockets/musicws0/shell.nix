with import <nixpkgs>{};
(haskellPackages.callPackage ./musicws.nix {}).env
