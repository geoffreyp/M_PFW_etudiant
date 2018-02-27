with (import <nixos> {});

let

  _vim = import ./vim.nix { inherit pkgs; };

  _emacs = import ./emacs.nix { inherit pkgs; };

  _emacswrap = pkgs.stdenv.mkDerivation {
    name = "emacswrap";
    src = ./.;
    installPhase = ''
      mkdir -p $out/bin
      cp emacswrap $out/bin/
    '';
  };

in

{

  packageOverrides = pkgs: with pkgs; {

    myPackages = pkgs.buildEnv {
      name = "myPackages";
      paths = [

        # editeurs 
        geany
        _vim
        _emacs _emacswrap aspellDicts.fr ctags 
        python3
        nodejs
        clang libcxx libcxxStdenv 

        # haskell
        cabal2nix
        cabal-install
        ghc

        # nixops
        nixops

        # autres
        evince
        gimp
        gnome3.eog
      ];
    };
  };
}

