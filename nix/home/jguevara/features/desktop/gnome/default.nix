{pkgs, ...}: {
  imports = [
    ../common
    ../common/wayland-wm
  ];

  home.packages = with pkgs; [
    gnomeExtensions.caffeine
  ];

  dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" = {
      click-method = "default";
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/shell" = {
      favorite-apps = ["google-chrome.desktop" "Alacritty.desktop"];
      enabled-extensions = [
        "caffeine@patapon.info"
      ];
    };
    "org/gnome/shell/extensions/caffeine" = {
      show-indicator = "always";
      toggle-shortcut = ["<Control><Alt>c"];
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
      ];
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Primary><Alt>t";
      command = "alacritty";
      name = "Open terminal";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Primary><Alt>b";
      command = "google-chrome-stable";
      name = "Open browser";
    };
  };
}
