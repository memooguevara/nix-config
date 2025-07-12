{pkgs, ...}: {
  imports = [
    ./git.nix
    ./neovim.nix
    ./tmux.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka-term
    curl
    httpie # Better curl
    eza # Better ls
    ripgrep # Better grep
    fd # Better find
    jq # JSON pretty printer and manipulator
    fastfetch
    nh # Nice wrapper for NixOS and HM
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
