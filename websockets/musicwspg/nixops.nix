{
  network.description = "musicwspg";

  myserver = { config, pkgs, ... }: 
  let
    _musicwspg = import ./default.nix { inherit pkgs; };
  in
  {
    networking.firewall.allowedTCPPorts = [ 80 9000 ];

    systemd.services.musicwspg = {
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      serviceConfig = {
        ExecStart = "${_musicwspg}/musicwspg";
        Restart = "always";
      };
    };

    services = {
      lighttpd = {
        enable = true;
        document-root = _musicwspg;
      };
      postgresql = {
        enable = true;
        package = pkgs.postgresql;
        initialScript = "${_musicwspg}/musicpg.sql";
        enableTCPIP = true;
        authentication = "local all all trust";
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


