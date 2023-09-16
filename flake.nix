{
  description = "A very basic flake";

  inputs.nixvim.url = "github:nix-community/nixvim";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    self,
    nixpkgs,
    nixvim,
    flake-utils,
  }: let
    config = {
      colorschemes.gruvbox.enable = true;
    };
  in
    flake-utils.lib.eachDefaultSystem (system: let
	  nixvim' = nixvim.legacyPackages."${system}";
      nvim = nixvim'.makeNixvim {
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
        plugins.mini.enable = true;
        plugins.mini.modules = {
          starter = {};
          cursorword = {};
          tabline = {};
          basics = {};
          indentscope = {};
          clue = {};
        };

        # git
        plugins.gitsigns.enable = true;

        # filetree
        plugins.neo-tree.enable = true;
      };
    in {
      packages = {
        inherit nvim;
        default = nvim;
      };
    });
}