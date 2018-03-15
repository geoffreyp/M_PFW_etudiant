with import <nixpkgs>{};
(haskellPackages.callPackage ./poemhub.nix {}).env
