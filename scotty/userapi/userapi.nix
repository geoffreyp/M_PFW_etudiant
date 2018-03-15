{ mkDerivation, aeson, base, connection, http-conduit, lucid, mtl
, scotty, sqlite-simple, stdenv, text, wai-cors, wai-extra
}:
mkDerivation {
  pname = "userapi";
  version = "0.1";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    aeson base connection http-conduit lucid mtl scotty sqlite-simple
    text wai-cors wai-extra
  ];
  license = stdenv.lib.licenses.bsd3;
}
