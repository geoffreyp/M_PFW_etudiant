with import <nixpkgs>{};
(haskellPackages.callPackage ./echows.nix {}).env
