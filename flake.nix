{
  description = "Devbox Flake";
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      follows = "nixpkgs";
    };
    neotree = {
      url = "github:nvim-neo-tree/neo-tree.nvim";
      flake = false;
    };
    plenary= {
      url = "github:nvim-lua/plenary.nvim";
      flake = false;
    };
    nui = {
      url = "github:MunifTanjim/nui.nvim";
      flake = false;
    };

  };
  outputs = { self, nixpkgs, flake-utils, nixvim, neotree, plenary, nui }:
    flake-utils.lib.eachSystem flake-utils.lib.allSystems (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        initLuaContent = builtins.readFile ./init.lua;
        # nvim-neotree = pkgs.stdenvNoCC.mkDerivation rec {
        #   name = "neotree";
        #   src = neotree;
        #   dontBuild = true;
        # };
        nvim-neotree = pkgs.vimUtils.buildVimPlugin {
          name = "neotree";
          src = neotree;
          dontBuild = true;
        };
        nvim-plenary = pkgs.vimUtils.buildVimPlugin {
          name = "plenary";
          src = plenary;
          dontBuild = true;
        };
        nui-nvim = pkgs.vimUtils.buildVimPlugin {
          name = "nui";
          src = nui;
          dontBuild = true;
        };
    


        # Neovim configuration
        myNeovim = pkgs.neovim.override {
          configure = {
            customRC = ''
              " Your custom Neovim configuration here
              set background=dark
              colorscheme catppuccin-mocha

              " Tree-sitter configuration
              packadd nvim-treesitter
              lua <<EOF
              require'nvim-treesitter.configs'.setup {
                highlight = {
                  enable = true,
                },
              }
              EOF
              "  Mini configuration

              lua <<EOF
              ''

            +  initLuaContent
            +''

              EOF
            '';
            packages.myVimPackage = with pkgs.vimPlugins; {
              start = [ 
                nvim-treesitter.withAllGrammars catppuccin-nvim mini-nvim nvim-neotree nvim-plenary nui-nvim];
            };
          };
        };
        commonDevbox = pkgs.mkShell {
          buildInputs = [
            myNeovim  # Self-contained Neovim
            pkgs.git
            pkgs.curl
            pkgs.htop
            # Add common development tools here
            # pkgs.neovim
            pkgs.tree
            pkgs.gnumake
          ];
        };
      in {
        defaultPackage = commonDevbox;
        devbox = commonDevbox;
      }
    );
}