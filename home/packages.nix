{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    lazygit
    bat
    fzf
    broot
    ripgrep
    helix
    gh
    dotnet-sdk_8
    fsautocomplete
    gcc
  ];
}
