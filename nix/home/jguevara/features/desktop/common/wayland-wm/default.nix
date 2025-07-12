{pkgs, ...}: {
  imports = [
    ./alacritty.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
  ];
}
