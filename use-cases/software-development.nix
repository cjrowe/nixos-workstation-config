{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jetbrains-toolbox
    nodejs_18
    temurin-bin-18
    dotnet-sdk
    terraform
  ];
}
