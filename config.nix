{
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "homelab-tools";
      paths = [
        fzf
        tmux
        neovim
        curl
        btop
        lazygit
      ];
    };
  };
}

