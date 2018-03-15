{ mkDerivation, base, bytestring, network, postgresql-simple
, stdenv, text, websockets
}:
mkDerivation {
  pname = "musicwspg";
  version = "0.1";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base bytestring network postgresql-simple text websockets
  ];
  license = stdenv.lib.licenses.bsd3;
}
