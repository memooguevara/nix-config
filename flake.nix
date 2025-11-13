{
  description = "My nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    systems.url = "github:nix-systems/default-linux";
    hardware.url = "github:nixos/nixos-hardware";
    impermanence.url = "github:nix-community/impermanence";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";
    nix-colors.url = "github:misterio77/nix-colors";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      # url = "path:/home/jguevara/nix-neovim";
      url = "github:memooguevara/nix-neovim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    systems,
    alacritty-theme,
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = nixpkgs.lib // home-manager.lib;
    forEachSystem = f: lib.genAttrs (import systems) (system: f pkgsFor.${system});
    pkgsFor = lib.genAttrs (import systems) (
      system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [alacritty-theme.overlays.default];
        }
    );
  in {
    inherit lib;
    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    formatter = forEachSystem (pkgs: pkgs.alejandra);
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild switch --flake .#ophiuchus'
    nixosConfigurations = {
      # Main laptop
      ophiuchus = lib.nixosSystem {
        modules = [./hosts/ophiuchus];
        specialArgs = {inherit inputs outputs;};
      };
      # Virtual laptop
      volans = lib.nixosSystem {
        modules = [./hosts/volans];
        specialArgs = {inherit inputs outputs;};
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager switch --flake .#jguevara@ophiuchus'
    homeConfigurations = {
      # Main laptop
      "jguevara@ophiuchus" = lib.homeManagerConfiguration {
        modules = [./home/jguevara/ophiuchus.nix ./home/jguevara/nixpkgs.nix];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
      };
      # Virtual laptop
      "jguevara@volans" = lib.homeManagerConfiguration {
        modules = [./home/jguevara/volans.nix ./home/jguevara/nixpkgs.nix];
        pkgs = pkgsFor.x86_64-linux;
        extraSpecialArgs = {inherit inputs outputs;};
      };
    };
  };
}
