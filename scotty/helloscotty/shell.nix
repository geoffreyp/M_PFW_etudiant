with import <nixpkgs>{};
(haskellPackages.callPackage ./helloscotty.nix {}).env
