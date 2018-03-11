{ mkDerivation, base, stdenv, xhtml }:
mkDerivation {
  pname = "hellocabal";
  version = "0.1";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base xhtml ];
  license = stdenv.lib.licenses.bsd3;
}
