{pkgs, ...}: let
  extensions = with pkgs.gnomeExtensions; [
    caffeine
    color-picker
    just-perfection
    space-bar
    tactile
  ];
in {
  imports = [
    ../common
    ../common/wayland-wm
  ];

  home.packages = extensions;

  dconf.settings = {
    "org/gnome/desktop/peripherals/touchpad" = {
      click-method = "default";
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    "org/gnome/mutter" = {
      dynamic-workspaces = false;
    };
    "org/gnome/desktop/wm/preferences" = {
      num-workspaces = 4;
    };
    "org/gnome/shell" = {
      favorite-apps = ["google-chrome.desktop" "Alacritty.desktop"];
      enabled-extensions = builtins.map (i: i.extensionUuid) extensions;
    };
    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-1 = ["<Super>1"];
      switch-to-workspace-2 = ["<Super>2"];
      switch-to-workspace-3 = ["<Super>3"];
      switch-to-workspace-4 = ["<Super>4"];
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
    "org/gnome/shell/extensions/caffeine" = {
      show-indicator = "always";
      toggle-shortcut = ["<Control><Alt>c"];
    };
    "org/gnome/shell/extensions/color-picker" = {
      auto-copy = true;
      color-picker-shortcut = ["<Control><Alt>p"];
      enable-shortcut = true;
      enable-systray = true;
    };
    "org/gnome/shell/extensions/just-perfection" = {
      accessibility-menu = false;
      animation = 2;
      world-clock = false;
    };
  };
}
