{
  programs.zsh = {
    enable = true;
    history.size = 10000;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initExtra = ''
      if [[ $- == *i* ]] && [[ $TMUX == "" ]] && [[ -t 1 ]]; then
        exec tmux
      fi
    '';
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "command-not-found"
      ];
      theme = "af-magic";
      extraConfig = ''
      '';
    };
    shellAliases = {
      ls = "eza --icons --grid";
      lg = "lazygit";
    };
  };
}
