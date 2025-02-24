{pkgs, ...}: {
  imports = [
    ./fish.nix
    ./fzf.nix
    ./starship.nix
  ];

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.git = {
    enable = true;
    difftastic.enable = true;
    userName = "alphashort";
    userEmail = "robertrivarola060@gmail.com";
    aliases = {
      st = "status";
      logd = "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
    };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      branch = {
        autosetuprebase = "always";
      };
      pull = {
        rebase = true;
      };
    };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      gui.theme = {
        activeBorderColor = [
          "#ff9e64"
          "bold"
        ];
        inactiveBorderColor = ["#29a4bd"];
        searchingActiveBorderColor = [
          "#ff9e64"
          "bold"
        ];
        optionsTextColor = ["#7aa2f7"];
        selectedLineBgColor = ["#2e3c64"];
        cherryPickedCommitFgColor = ["#7aa2f7"];
        cherryPickedCommitBgColor = ["#bb9af7"];
        markedBaseCommitFgColor = ["#7aa2f7"];
        markedBaseCommitBgColor = ["#e0af68"];
        unstagedChangesColor = ["#db4b4b"];
        defaultFgColor = ["#c0caf5"];
      };
    };
  };

  programs.bat = {enable = true;};

  programs.direnv = {
    enable = true;
    nix-direnv.enable =
      true;
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    extraOptions = ["-l" "--icons" "--git" "-a"];
  };

  programs.lf = {
    enable = true;
    settings = {
      preview = true;
      drawbox = true;
      hidden = true;
      icons = true;
      theme = "Dracula";
      previewer = "bat";
    };
  };

  programs.jq = {
    enable = true;
    colors = {
      null = "1;35";
      false = "0;35";
      true = "0;35";
      numbers = "0;32";
      strings = "0;33";
      arrays = "1;37";
      objects = "1;37";
    };
  };

  home.packages = with pkgs; [
    alejandra
    bc
    cachix
    comma
    coreutils
    devenv
    entr
    fabric-ai
    fd
    gcc
    go
    httpie
    just
    lorri
    llm
    nix-index
    procs
    progress
    rar
    ripgrep
    silver-searcher
    tldr
    trash-cli
    unzip
    wget
    wttrbar
    yazi
    zip
  ];
}
