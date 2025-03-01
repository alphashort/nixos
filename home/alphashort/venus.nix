{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.desktop.hyprland;
in {
  imports = [
    ../common
    ./home.nix
    ../features/cli
    ../features/coding
    ../features/desktop
  ];

  options.features.desktop.hyprland.enable =
    mkEnableOption "enable Hyprland";

  config = mkMerge [
    # Base configuration
    {
      xdg = {
        # TODO: better structure
        enable = true;
        configFile."mimeapps.list".force = true;
        mimeApps = {
          enable = true;
          associations.added = {
            "application/zip" = ["org.gnome.FileRoller.desktop"];
            "application/csv" = ["calc.desktop"];
            "application/pdf" = ["io.github.zen_browser.zen.desktop"];
            "x-scheme-handler/http" = ["io.github.zen_browser.zen.desktop"];
            "x-scheme-handler/https" = ["io.github.zen_browser.zen.desktop"];
          };
          defaultApplications = {
            "application/zip" = ["org.gnome.FileRoller.desktop"];
            "application/csv" = ["calc.desktop"];
            "application/pdf" = ["io.github.zen_browser.zen.desktop"];
            "application/md" = ["dev.zed.Zed.desktop"];
            "application/text" = ["dev.zed.Zed.desktop"];
            "x-scheme-handler/http" = ["io.github.zen_browser.zen.desktop"];
            "x-scheme-handler/https" = ["io.github.zen_browser.zen.desktop"];
          };
        };
      };
      features = {
        cli = {
          fastfetch.enable = true;
          fish.enable = true;
          fzf.enable = true;
          starship.enable = true;
        };
        desktop = {
          coding.enable = true;
          hyprland.enable = true;
          media.enable = true;
          office.enable = true;
          rofi.enable = true;
          fonts.enable = true;
          wayland.enable = true;
        };
      };
    }

    (mkIf cfg.enable {
      wayland.windowManager.hyprland = {
        enable = true;
        settings = {
          monitor = [
            "eDP-1,1366x768@60,0x0,1"
          ];
        };
      };
    })
  ];
}
