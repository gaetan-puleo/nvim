{
  description = "Devbox Flake";
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim = {
      url = "github:nix-community/nixvim";
      follows = "nixpkgs";
    };

  };
  outputs = { self, nixpkgs, flake-utils, nixvim }:
    flake-utils.lib.eachSystem flake-utils.lib.allSystems (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
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
                -- basic config
                require('mini.basics').setup()

                -- statusline
                require('mini.statusline').setup()

                -- welcome page
                require('mini.starter').setup()
              
                -- basic tabline
                require('mini.tabline').setup()
              EOF
            '';
            packages.myVimPackage = with pkgs.vimPlugins; {
              start = [ 
                nvim-treesitter.withAllGrammars catppuccin-nvim mini-nvim];
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
          ];
        };
      in {
        defaultPackage = commonDevbox;
        devbox = commonDevbox;
      }
    );
}