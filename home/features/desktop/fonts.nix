{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.desktop.fonts;
in {
  options.features.desktop.fonts.enable =
    mkEnableOption "install additional fonts for desktop apps";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      victor-mono
      powerline-symbols
      (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "NerdFontsSymbolsOnly" ]; })
      font-awesome_5
      noto-fonts-emoji
    ];
  };
}
