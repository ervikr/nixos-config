{ pkgs, ... }:

{
  environment.systemPackages = with pkgs [
      mistral-vibe # Mistral ai vibe CLI coding agent
  ];
}
