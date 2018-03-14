{ mkDerivation, base, bytestring, network, stdenv, websockets, wuss
}:
mkDerivation {
  pname = "echo-client";
  version = "0.1";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base bytestring network websockets wuss
  ];
  license = stdenv.lib.licenses.bsd3;
}
