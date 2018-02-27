{ pkgs ? import <nixpkgs> {} }:

pkgs.emacsPackagesNg.emacsWithPackages ( epkgs: with epkgs.melpaPackages; [
  avy
  company
  ecb
  elpy
  flycheck
  ggtags
  haskell-mode
  julia-mode
  magit
  markdown-mode
  monokai-theme
  nix-mode
])

