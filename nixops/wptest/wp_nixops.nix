{

  network.description = "mywordpress";

  mywordpress = { config, pkgs, ... }: 

  let

    responsiveTheme = pkgs.stdenv.mkDerivation {
      name = "responsive-theme";
      src = pkgs.fetchurl {
        url = http://wordpress.org/themes/download/responsive.3.9.zip;
        sha256 = "17gkcrs33lkdqyhvj7hx21jmhr15i4m3wy8nnndyjh0kvsl3gfgh";
      };
      buildInputs = [ pkgs.unzip ];
      installPhase = "mkdir -p $out; cp -R * $out/";
    };

  in

  {

    networking.firewall.allowedTCPPorts = [ 80 ];

    services.mysql = {
      enable = true;
      package = pkgs.mysql;
    };

    services.httpd = {
      enable = true;
      adminAddr="toto@example.com";
      extraModules = [
        { name = "php7"; path = "${pkgs.php}/modules/libphp7.so"; }
      ];
      virtualHosts = [
        {
          extraSubservices = [
            {
              serviceType = "wordpress";
              dbPassword = "wordpress";
              wordpressUploads = "/data/uploads";
              themes = [ responsiveTheme ];
              languages = [ "fr_FR" ];
            }
          ];
        }
      ];
    };

    deployment = {
      targetEnv = "virtualbox";
      virtualbox.memorySize = 512; 
      virtualbox.vcpu = 1; 
      virtualbox.headless = true;
    };

  };

}

