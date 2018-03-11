{
  network.description = "music";

  webserver = { config, pkgs, ... }: 
  let
    _app = import ./default.nix { inherit pkgs; };
  in
  {
    networking.firewall.allowedTCPPorts = [ 80 ];

    services.lighttpd = {
      enable = true;
      document-root = _app;
      enableModules = [ "mod_cgi" ];
      extraConfig = ''
        cgi.assign = ( ".cgi"  => "" )
        '';
    };

    services.postgresql = {
      enable = true;
      package = pkgs.postgresql;
      initialScript = "${_app}/music.sql";
      enableTCPIP = true;
      authentication = "local all all trust";
    };

   deployment = {
     targetEnv = "virtualbox";
     virtualbox = {
       memorySize = 512; 
       vcpu = 1; 
       headless = true;
     };
   };
  };

}

