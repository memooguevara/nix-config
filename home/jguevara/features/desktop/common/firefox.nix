{
  inputs,
  pkgs,
  ...
}: {
  programs.firefox = {
    enable = true;
    profiles.jguevara = {
      bookmarks = {
        force = true;
        settings = [
          {
            name = "Wikipedia";
            tags = ["wiki"];
            keyword = "wiki";
            url = "https://wikipedia.org";
          }
        ];
      };
      extensions.packages = with inputs.firefox-addons.packages.${pkgs.system}; [
        bitwarden
        ublock-origin
      ];
      settings = {
        "dom.security.https_only_mode" = true;
        "browser.download.panel.shown" = true;
        # Disable fx accounts
        "identity.fxaccounts.enabled" = false;
        # Disable "save password" prompt
        "signon.rememberSignons" = false;
      };
    };
  };
}
