{
  network.description = "simple scripts";

  simple_scripts = { config, pkgs, ... }: {

    networking.firewall.allowedTCPPorts = [ 80 ];

    services.lighttpd = {
      enable = true;
      document-root = import ./default.nix { inherit pkgs; };
      # TODO cgi
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

