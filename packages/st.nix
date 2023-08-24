{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (st.overrideAttrs (oldAttrs: rec {
      src = fetchFromGitHub {
        owner = "cjrowe";
        repo = "st";
        rev = "36d225d71d448bfe307075580f0d8ef81eeb5a87";
        sha256 = "08364arwp4al0x91fs91gnmk2mpdw2n9aa1x9gw78bwvmbykrhdv";
      };
      buildInputs = oldAttrs.buildInputs ++ [ harfbuzz ];
    }))
  ];
}
