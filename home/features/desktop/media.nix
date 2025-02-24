{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.desktop.media;
in {
  options.features.desktop.media.enable =
    mkEnableOption "enable media features";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      amf
      blueberry
      ffmpeg_6-full
      gst_all_1.gstreamer
      gst_all_1.gst-vaapi
      mpv
      yt-dlp
      pamixer
      qpwgraph
      v4l-utils
      audacious
    ];
  };
}
