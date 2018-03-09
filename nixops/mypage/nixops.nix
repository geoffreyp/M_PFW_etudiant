{
  network.description = "my page";

  mypage = { pkgs, ... }: {

    networking.firewall.allowedTCPPorts = [ 80 ];

    # service...

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

