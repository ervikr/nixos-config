{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty
    btop
    screen
    tmux
  ];
}
