{lib, ...}: {
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        device = "/dev/sda";
        useOSProber = true;
      };
    };
    initrd = {
      availableKernelModules = [
        "ata_piix"
        "ohci_pci"
        "ehci_pci"
        "ahci"
        "sd_mod"
        "sr_mod"
      ];
      kernelModules = [];
    };
    kernelModules = [];
    extraModulePackages = [];
    supportedFilesystems = ["ntfs"];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/8a53df9e-9d51-4163-9def-3fac50815350";
    fsType = "ext4";
  };

  swapDevices = [];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  virtualisation.virtualbox.guest.enable = true;
}
