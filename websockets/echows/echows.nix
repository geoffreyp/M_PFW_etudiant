{ mkDerivation, base, bytestring, network, stdenv, text, websockets
}:
mkDerivation {
  pname = "echows";
  version = "0.1";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base bytestring network text websockets
  ];
  license = stdenv.lib.licenses.bsd3;
}
