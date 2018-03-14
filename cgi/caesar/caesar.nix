{ mkDerivation, base, cgi, network, stdenv, xhtml }:
mkDerivation {
  pname = "caesar";
  version = "0.1";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base cgi network xhtml ];
  license = stdenv.lib.licenses.bsd3;
}
