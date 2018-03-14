{ mkDerivation, base, binary, bytestring, network, stdenv, text
, websockets
}:
mkDerivation {
  pname = "echocaesar";
  version = "0.1";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base binary bytestring network text websockets
  ];
  license = stdenv.lib.licenses.bsd3;
}
