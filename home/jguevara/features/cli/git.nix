{pkgs, ...}: {
  home.packages = with pkgs; [lazygit];
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      pull.rebase = false;
      user = {
        name = "Jonathan Guevara";
        email = "memooguevara@gmail.com";
      };
    };
  };
}
