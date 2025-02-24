{pkgs, ...}: {
  home.packages = with pkgs; [
    (python3.withPackages (ps:
      with ps; [
        # Scientific packages
        numba
        numpy
        openai-whisper
        torch
        srt
      ]))
    nixd
    alejandra
    tailwindcss
    tailwindcss-language-server
  ];
}
