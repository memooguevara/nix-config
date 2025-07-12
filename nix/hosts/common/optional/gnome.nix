{
  services = {
    desktopManager.gnome = {
      enable = true;
    };
    displayManager.gdm = {
      enable = true;
      autoSuspend = false;
    };
    gnome.games.enable = true;
  };
}
