{
  network.description = "hellohs";

  hellohs = { config, pkgs, ... }: {
    networking.firewall.allowedTCPPorts = [ 80 ];

    services.lighttpd = {
      enable = true;
      document-root = import ./default.nix { inherit pkgs; };
      enableModules = [ "mod_cgi" ];
      extraConfig = ''
        cgi.assign = ( ".cgi"  => "" )
        '';
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

