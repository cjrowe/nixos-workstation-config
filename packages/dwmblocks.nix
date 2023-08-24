{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (dwmblocks.overrideAttrs (oldAttrs: rec {
      src = fetchFromGitHub {
        owner = "cjrowe";
        repo = "dwmblocks";
        rev = "1083cd7f95d0d64d9f8048cc628d85768d386d08";
        sha256 = "064m5r9d0j3fr45m4l4mdq1wlnxm1aqvxz8zp7vwa9fmjskjskmf";
      };
    }))
  ];
}
