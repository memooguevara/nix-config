{lib, ...}: {
  services = {
    tlp.enable = true;
    power-profiles-daemon.enable = lib.mkAfter false;
  };
}
