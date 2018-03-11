{
  network.description = "make img";

  make_img = { config, pkgs, ... }: 

  let
    _pythonPackages = (pkgs.python3.buildEnv.override {
      extraLibs = with pkgs.python3Packages; [ pillow ];
    });
  in

  {
    networking.firewall.allowedTCPPorts = [ 80 ];

    services.lighttpd = {
      enable = true;
      document-root = import ./default.nix { inherit pkgs; };
      enableModules = [ "mod_cgi" ];
      extraConfig = ''
        cgi.assign = ( ".py"  => "${_pythonPackages}/bin/python" )
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

