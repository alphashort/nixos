{pkgs, ...}: {
  imports = [
    ./coding.nix
    ./fonts.nix
    ./hyprland.nix
    ./media.nix
    ./office.nix
    ./rofi.nix
    ./theme.nix
    ./wayland.nix
  ];

  xdg = {
    enable = true;
    configFile."mimeapps.list".force = true;
    mimeApps = {
      enable = true;
      associations.added = {
        "application/zip" = ["org.gnome.FileRoller.desktop"];
        "application/csv" = ["calc.desktop"];
        "application/pdf" = ["okularApplication_pdf.desktop"];
      };
      defaultApplications = {
        "application/zip" = ["org.gnome.FileRoller.desktop"];
        "application/csv" = ["calc.desktop"];
        "application/pdf" = ["okularApplication_pdf.desktop"];
        "application/md" = ["nvim.desktop"];
        "application/text" = ["nvim.desktop"];
        "x-scheme-handler/http" = ["io.github.zen_browser.zen"];
        "x-scheme-handler/https" = ["io.github.zen_browser.zen"];
      };
    };
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  home.sessionVariables = {
    WEBKIT_DISABLE_COMPOSITING_MODE = "1";
    NIXOS_OZONE_WL = "1";
    TERMINAL = "kitty";
    QT_QPA_PLATFORM = "wayland";
  };
  home.sessionPath = ["\${XDG_BIN_HOME}" "\${HOME}/.cargo/bin" "$HOME/.npm-global/bin"];

  fonts.fontconfig.enable = true;

  services.mako = {
    enable = true;
    backgroundColor = "#282a36";
    textColor = "#80FFEA";
    borderColor = "#9742b5";
    width = 400;
    height = 150;
    padding = "10,20";
    borderRadius = 8;
    borderSize = 1;
    margin = "20,20";
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "~/Pictures/Wallpapers/wall4.jpg"
      ];
      wallpaper = [
        "eDP-1,~/Pictures/Wallpapers/wall4.jpg"
      ];
    };
  };

  programs.kitty = {
    enable = true;
    shellIntegration = {
      enableFishIntegration = true;
      enableBashIntegration = true;
    };
    font = {name = "Jetbrains Mono 12";};
    themeFile = "Dracula";
    settings = {copy_on_select = "yes";};
    extraConfig = ''
      background_opacity 0.6
      enable_audio_bell no
      close_on_child_death yes
    '';
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 12;
  };

  home.packages = with pkgs; [
    appimage-run
    brave
    seahorse
    sushi
    telegram-desktop
  ];
}
