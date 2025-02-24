{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.features.desktop.rofi;
in {
  options.features.desktop.rofi.enable = mkEnableOption "enable rofi";

  config = mkIf cfg.enable {
    programs.rofi = with pkgs; {
      enable = true;
      package = rofi.override {
        plugins = [
          rofi-calc
          rofi-emoji
          stable.rofi-file-browser
        ];
      };
      pass = {
        enable = true;
        package = rofi-pass-wayland;
      };
      terminal = "\${pkgs.kitty}/bin/kitty";
      font = "Jetbrains Mono 12";
      extraConfig = {
        show-icons = true;
        disable-history = false;
        modi = "drun,calc,emoji,filebrowser";
        kb-primary-paste = "Control+V,Shift+Insert";
        kb-secondary-paste = "Control+v,Insert";
      };
      theme = ./rofi.rasi;
    };
  };
}
