{ pkgs-stable, ... }:

{
  environment.systemPackages = with pkgs-stable; [
      mistral-vibe # Mistral ai vibe CLI coding agent
  ];
}
