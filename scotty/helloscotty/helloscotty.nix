{ mkDerivation, base, lucid, mtl, scotty, sqlite-simple, stdenv
, text, wai-extra
}:
mkDerivation {
  pname = "helloscotty";
  version = "0.1";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base lucid mtl scotty sqlite-simple text wai-extra
  ];
  license = stdenv.lib.licenses.bsd3;
}
