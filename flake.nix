{ 
  description = "My neovim config";
  inputs.nixvim.url = "github:nix-community/nixvim";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  # plugins
  inputs.nvim-window-picker-src = {
    url = "github:s1n7ax/nvim-window-picker";
    flake = false;
  };

  inputs.nvim-comment-src = {
    url = "github:terrortylor/nvim-comment";
    flake = false;
  };

  outputs = {
    self,
    nixpkgs,
    nixvim,
    flake-utils,
    nvim-window-picker-src,
    nvim-comment-src
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages."${system}";
      nvim = nixvim.legacyPackages."${system}".makeNixvim {
        extraConfigLua = "" + 
        builtins.readFile "${self}/config/plugins/nvim-comment.lua";
        
        # options
        globals.mapleader = " "; # Sets the leader key to space
        maps = import "${self}/config/maps.nix";
        # colorscheme
        colorschemes.catppuccin.enable = true;
        colorschemes.catppuccin.flavour = "mocha";

        # lsp
        plugins.lsp.enable = true ;
        
        # statusline
        plugins.lightline.enable = true;

        # treesitter
        plugins.treesitter.enable = true;
        plugins.treesitter.ensureInstalled = "all";

        plugins.ts-autotag.enable = true;
        plugins.treesitter-refactor.enable = true;
        plugins.ts-context-commentstring.enable = true;

        # plugins
	      plugins.mini = import "${self}/config/plugins/mini.nix";

        # git
        plugins.gitsigns.enable = true;

        # filetree
        plugins.neo-tree = import "${self}/config/plugins/neo-tree.nix";

        extraPlugins = [
          (pkgs.vimUtils.buildVimPlugin {
            name = "nvim-window-picker";
            src = nvim-window-picker-src;
          })

          (pkgs.vimUtils.buildVimPlugin {
            name = "nvim-comment";
            src = nvim-comment-src;
            buildPhase = ":";
          })
        ];
      };
    in {
      packages = {
        inherit nvim;
        default = nvim;
      };
    });
}
