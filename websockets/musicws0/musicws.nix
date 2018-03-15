{ mkDerivation, base, bytestring, network, postgresql-simple
, stdenv, websockets
}:
mkDerivation {
  pname = "musicws";
  version = "0.1";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base bytestring network postgresql-simple websockets
  ];
  license = stdenv.lib.licenses.bsd3;
}
