{
  pkgs,
  ruby-nix,
  bundix,
  ...
}:
with pkgs;
let
  rubyNix = ruby-nix.lib pkgs {
    gemset = ./gemset.nix;
    ruby = ruby_3_3;
    gemConfig = defaultGemConfig;
  };
in
{
  packages = [
    bundix.packages.${stdenv.system}.default
    editorconfig-core-c
    git
    rubyNix.env
    watchman
  ];

  env.RUBY_YJIT_ENABLE = 1;
  enterTest = "rake";
  cachix.enable = false;
}
