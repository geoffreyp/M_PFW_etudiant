{
  network.description = "echows";

  echows = { config, pkgs, ... }:
    let
    _echows = import ./default.nix { inherit pkgs; };
  in
  {
    networking.firewall.allowedTCPPorts = [ 80 9000 ];

    services.lighttpd = {
      enable = true;
      document-root = "${_echows}/client/";
    };

    systemd.services.echows = {
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      serviceConfig = {
        ExecStart = "${_echows}/echows";
        Restart = "always";
      };
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

