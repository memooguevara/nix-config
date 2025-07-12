{pkgs, ...}: {
  users.users.jguevara = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "jguevara";
    extraGroups = [
      "docker"
      "networkmanager"
      "wheel"
    ];
    packages = [pkgs.home-manager];
  };
}
