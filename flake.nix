{
  description = "Environnement de dev perso";
  ##nixConfig.bash-prompt = "\[nix-develop\ ]$ ";
  inputs = {
    # Nixpkgs / NixOS version to use.
    # nixpkgs.url = "nixpkgs/nixos-23.05";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    
    # neovim = {
    #   url = "github:neovim/neovim/stable?dir=contrib";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs }: 
  let 
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in { 
    packages.x86_64-linux.default = pkgs.mkShell {
      shellHook = ''
      DEVBOX="~/devbox"
      alias nuke="rm -rf"
      alias md="mkdir"
      alias nvim="nvim -u $DEVBOX/init.vim"
      alias vim="nvim"

        figlet "Welcome to devbox" | lolcat
      '';
      nativeBuildInputs = with pkgs; [
        # lolz
        figlet
        lolcat
        
        # shell
        fish
        
        nodejs_20
        neovim

        tmux
        wget
        curl
        jq
      ];
  };
};
}