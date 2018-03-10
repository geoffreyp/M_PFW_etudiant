{ config, pkgs, ... }: {

  imports = [ ./hardware-configuration.nix ];

  boot.kernelModules = [ "fuse" ];

  boot.loader.grub = {
    device = "/dev/sda"; 
    enable = true;
    version = 2;
  };

  #environment.shellInit = ''
  #  export http_proxy="http://TODO:TODO@192.168.22.62:3128"; 
  #  export https_proxy="$http_proxy"; 
  #'';

  environment.systemPackages = with pkgs; [
    emacs chromium firefox geany git sshfs-fuse sudo vim 
  ];

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "fr";
    defaultLocale = "fr_FR.UTF-8";
  };

  networking.proxy.default = "TODO:TODO@192.168.22.62:3128"; 
  networking.proxy.noProxy = "127.0.0.1,localhost,192.168.56.*"; 

  networking.hostName = "TODO"; 

  programs.bash.enableCompletion = true;

  services = {
    dbus.enable = true;
    udisks2.enable = true;
    xserver = {
      desktopManager.xfce.enable = true;
      displayManager.lightdm.enable = true;
      enable = true;
      layout = "fr";
    };
  };

  system.stateVersion = "17.09";

  time.timeZone = "Europe/Paris";

  users.extraUsers.TODO = {
    extraGroups = [ "wheel" "vboxusers" ];
    isNormalUser = true;
  };

  virtualisation.virtualbox.host.enable = true;
}

