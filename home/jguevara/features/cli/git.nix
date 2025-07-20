{pkgs, ...}: {
  home.packages = with pkgs; [lazygit];
  programs.git = {
    enable = true;
    userName = "Jonathan Guevara";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };
}
