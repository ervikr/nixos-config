{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    alacritty
    btop
    screen
    tmux
    _7zz # CLI 7zip (7zz)
  ];
}
