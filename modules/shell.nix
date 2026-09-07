{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tree
    alacritty
    btop
    screen
    tmux
    _7zz # CLI 7zip (7zz)
  ];
}
