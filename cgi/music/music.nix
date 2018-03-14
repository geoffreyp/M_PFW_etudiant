{ mkDerivation, base, bytestring, cgi, network, postgresql-simple
, stdenv, xhtml
}:
mkDerivation {
  pname = "music";
  version = "0.1";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base bytestring cgi network postgresql-simple xhtml
  ];
  license = stdenv.lib.licenses.bsd3;
}
