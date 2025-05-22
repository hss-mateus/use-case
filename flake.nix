{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    devenv = {
      url = "github:cachix/devenv";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ruby-nix = {
      url = "github:inscapist/ruby-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    bundix = {
      url = "github:inscapist/bundix/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-ruby = {
      url = "github:bobvanderlinden/nixpkgs-ruby";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    extra-trusted-public-keys = "nixpkgs-ruby.cachix.org-1:vrcdi50fTolOxWCZZkw0jakOnUI1T19oYJ+PRYdK4SM=";
    extra-substituters = "https://nixpkgs-ruby.cachix.org";
  };

  outputs =
    {
      self,
      nixpkgs,
      devenv,
      ...
    }@inputs:
    let
      sys = builtins.currentSystem;
      shell = self.devShells.${sys}.default.config;
    in
    {
      packages.${sys} = {
        devenv-up = shell.procfileScript;
        devenv-test = shell.test;
      };

      devShells.${sys}.default = devenv.lib.mkShell {
        inherit inputs;
        pkgs = import nixpkgs {
          system = sys;
          config.allowUnfree = true;
        };
        modules = [ ./devenv.nix ];
      };
    };
}
