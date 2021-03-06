{
  network.description = "pgphptest";

  webserver = { config, pkgs, ... }: 
  let
    _pgphptest = import ./pgphptest.nix { inherit pkgs; };
  in
  {
    networking.firewall.allowedTCPPorts = [ 80 ];

    services.httpd = {
      enable = true;
      adminAddr = "toto@example.com";
      #documentRoot = "/data/public";
      documentRoot = "${_pgphptest}/public";
      extraModules = [
        { name = "php7"; path = "${pkgs.php}/modules/libphp7.so"; }
      ];
    };

    services.postgresql = {
      enable = true;
      package = pkgs.postgresql;
      initialScript = "${_pgphptest}/private/music.sql";
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

