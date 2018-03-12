with import <nixpkgs>{};
(haskellPackages.callPackage ./echocaesar.nix {}).env
