{
  network.description = "musicws";

  myserver = { config, pkgs, ... }: 
  let
    _musicws = import ./default.nix { inherit pkgs; };
  in
  {
    networking.firewall.allowedTCPPorts = [ 80 9000 ];

    systemd.services.musicws = {
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      serviceConfig = {
        ExecStart = "${_musicws}/musicws";
        Restart = "always";
      };
    };

    services = {
      lighttpd = {
        enable = true;
        document-root = _musicws;
      };
      postgresql = {
        enable = true;
        package = pkgs.postgresql;
        initialScript = "${_musicws}/music.sql";
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


