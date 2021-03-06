{ mkDerivation, base, network, sqlite-simple, stdenv, text
, websockets
}:
mkDerivation {
  pname = "musicws";
  version = "0.1";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base network sqlite-simple text websockets
  ];
  license = stdenv.lib.licenses.bsd3;
}
