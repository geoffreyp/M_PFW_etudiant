with import <nixpkgs>{};
(haskellPackages.callPackage ./chat.nix {}).env
