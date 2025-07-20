{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    settings = {
      font-size = 18;
      # font-family = "JetBrainsMono Nerd Font";
      font-family = "IosevkaTerm NFM";

      # The default is a bit intense for my liking
      # but it looks good with some themes
      # unfocused-split-opacity = 0.96;

      # Some macOS settings
      # window-theme = "dark";
      # macos-option-as-alt = true;

      # Disables ligatures
      # font-feature = ["-liga" "-dlig" "-calt"];
    };
  };
}
