{ pkgs, ... }:

{
  # Packages
  environment.systemPackages = with pkgs; [
    # GitHub CLI
    github-cli

    # JetBrains apps
    jetbrains.idea
    jetbrains.datagrip
    jetbrains.gateway
    jetbrains.rider
    jetbrains.webstorm

    # API platform
    postman
    bruno

    # IDE
    vscode
    zed-editor

    direnv
    gcc

    man-pages
    man-pages-posix
  ];

  # Enable direnv
  # - Direnv lets you load and unload environment variables depending on the current directory.
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
