{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shortcut = "a";
    keyMode = "vi";
    terminal = "screen-256color";
    baseIndex = 1;
    clock24 = true;
    aggressiveResize = true;
    disableConfirmationPrompt = true;
    shell = "${pkgs.zsh}/bin/zsh";
    extraConfig = ''
      # set-default colorset-option -ga terminal-overrides ",xterm-256color:Tc"
      set -as terminal-features ",xterm-256color:RGB"
      #set-option -ga terminal-overrides ",xterm*:Tc"

      # switch widows alt+number
      bind-key -n M-1 select-window -t 1
      bind-key -n M-2 select-window -t 2
      bind-key -n M-3 select-window -t 3
      bind-key -n M-4 select-window -t 4
      bind-key -n M-5 select-window -t 5

      # floating window
      bind-key -n M-g if-shell -F '#{==:#{session_name},scratch}' {
        detach-client
      } {
        display-popup -E "tmux new-session -A -s scratch"
      }

      set -sg escape-time 0
      set -g status-interval 0
      set -g status-position top
    '';
    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      vim-tmux-navigator
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-nvim 'session'
          #set -g @resurrect-save 'C-s'
          #set -g @resurrect-restore 'C-r'
        '';
      }
      {
        plugin = tokyo-night-tmux;
      }
    ];
  };
}
