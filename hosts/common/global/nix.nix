{
  nix = {
    # trusted-users = [
    #   "root"
    #   "@wheel"
    # ];
    settings = {
      experimental-features = ["nix-command" "flakes"];
    };
  };
}
