{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tree
    alacritty
    btop
    screen
    tmux
    _7zz # CLI 7zip (7zz)
    yazi # TUI file manager
    croc # The CLI tool for sending files
    taskwarrior3 # Manage tasks in the CLI
    cava # Music vizualizer
    nyancat
    sl # Steam Locomotive runs across your terminal when you type 'sl'
    asciiquarium-transparent # type asciiquarium
    nsnake # Snake game
  ];
}
