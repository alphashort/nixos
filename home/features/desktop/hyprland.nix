{
  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "dbus-update-activation-environment --systemd --all"
        "systemctl --user inport-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "waybar"
        "hyprctl setcursor Bibata-Modern-Ice 12"
        "hyprpaper"
        "hypridle"
        "wl-paste -p -t text --watch clipman store -P --histpath=\"~/.local/share/clipman-primary.json\""
      ];

      env = [
        "GDK_SCALE,1"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "GDK_BACKEND,wayland,x11"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "QT_SCALE_FACTOR,1"
        "SDL_VIDEODRIVER,wayland"
        "CLUTTER_BACKEND,wayland"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "NIXOS_OZONE_WL,1"
        "XCURSOR_SIZE,12"
        "HYPRCURSOR_THEME,Bibata-Modern-Ice"
        "WLR_NO_HARDWARE_CURSORS,1"
        "GTK_THEME,Dracula"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 0;
        extend_border_grab_area = 30;
        "col.active_border" = "rgba(9742b5ee) rgba(9742b5ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        dim_inactive = true;
        dim_strength = 0.25;
        shadow = {
          enabled = true;
          range = 60;
          render_power = 3;
          color = "rgba(1E202966)";
          offset = "1 2";
          scale = 0.97;
        };
        blur = {
          enabled = true;
          size = 3;
          passes = 2;
          new_optimizations = true;
          xray = true;

          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;
        bezier = "defaultBezier, 0.05, 0.9, 0.1, 1.1";
        animation = [
          "windows, 1, 4, defaultBezier, popin 80%"
          "windowsOut, 1, 4, default, popin 80%"
          "border, 1, 1, default"
          "borderangle, 1, 4, default"
          "fade, 1, 10, default"
          "workspaces, 1, 3, defaultBezier, slidevert"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = -1; # Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
        animate_manual_resizes = true;
      };

      input = {
        kb_layout = "latam";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";

        follow_mouse = 1;

        sensitivity = 0.4;

        touchpad = {
          natural_scroll = false;
          disable_while_typing = true;
          tap-to-click = true;
        };
      };

      gestures = {
        workspace_swipe = false;
      };

      device = [
        {
          name = "epic-mouse-v1";
          sensitivity = -0.5;
        }
      ];

      xwayland = {
        use_nearest_neighbor = true;
        force_zero_scaling = true;
      };

      cursor = {
        persistent_warps = true;
        no_hardware_cursors = false;
        enable_hyprcursor = true;
        warp_on_change_workspace = true;
      };

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, return, exec, kitty"
        "$mainMod, T, exec, kitty -e fish -c 'neofetch; exec fish'"
        "$mainMod, O, exec, hyprctl setprop activewindow opaque toggle"
        "$mainMod, Escape, exec, wlogout -p layer-shell"
        "$mainMod, C, killactive"
        "$mainMod, Q, exit"
        "$mainMod SHIFT, F, fullscreen"
        "$mainMod, V, togglefloating"
        "$mainMod, D, exec, rofi -show"
        "$mainMod, F, exec, thunar"
        "$mainMod, Y, exec, kitty -e yazi"
        "$mainMod, N, exec, kitty -e nvim"
        "$mainMod, Z, exec, zeditor"
        "$mainMod, B, exec, brave"
        "$mainMod, M, exec, virt-manager"
        "$mainMod SHIFT, B, exec, bemoji"
        "$mainMod, P, exec, rofi-pass"
        "$mainMod SHIFT, P, pseudo"
        "$mainMod, J, togglesplit"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod SHIFT, T, togglegroup"
        "$mainMod, left, changegroupactive, b"
        "$mainMod, right, changegroupactive, f"
        "$mainMod SHIFT, left, moveintogroup, l"
        "$mainMod SHIFT, right, moveintogroup, r"
        "$mainMod SHIFT, up, moveintogroup, u"
        "$mainMod SHIFT, down, moveintogroup, d"
        "$mainMod SHIFT CONTROL, left, moveoutofgroup, l"
        "$mainMod SHIFT CONTROL, right, moveoutofgroup, r"
        "$mainMod SHIFT CONTROL, up, moveoutofgroup, u"
        "$mainMod SHIFT CONTROL, down, moveoutofgroup, d"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindel = [
        ", xf86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ --limit 1"
        ", xf86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];

      bindl = [
        ", xf86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      windowrule = [
        "float, file_progress"
        "float, confirm"
        "float, dialog"
        "float, download"
        "float, notification"
        "float, error"
        "float, splash"
        "float, confirmreset"
        "float, title:Open File"
        "float, title:branchdialog"
        "float, dunst"
        "float, pavucontrol-qt"
        "float, pavucontrol"
        "float, file-roller"
        "fullscreen, wlogout"
        "float, title:wlogout"
        "fullscreen, title:wlogout"
        "idleinhibit focus, mpv"
        "float, title:^(Media viewer)$"
        "float, title:^(Volume Control)$"
        "float, title:^(Picture-in-Picture)$"
        "size 800 600, title:^(Volume Control)$"
        "move 75 44%, title:^(Volume Control)$"
      ];
    };
  };
}
