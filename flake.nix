{
  description = "zack466 Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: {
    defaultPackage.aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;
 
    homeConfigurations = {
      "zack4" = inputs.home-manager.lib.homeManagerConfiguration {
        system = "aarch64-darwin";
        homeDirectory = "/Users/zack4";
        username = "zack4";
        configuration.imports = [ ./home.nix ];
      };
    };
  };
}
