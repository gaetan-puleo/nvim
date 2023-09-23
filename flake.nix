{
  description = "My neovim config";
  inputs = {
    nixvim.url = "github:nix-community/nixvim";
    flake-utils.url = "github:numtide/flake-utils";

  # plugins
    nvim-window-picker-src = {
      url = "github:s1n7ax/nvim-window-picker";
      flake = false;
    };

    nvim-comment-src = {
      url = "github:terrortylor/nvim-comment";
      flake = false;
    };

    nvim-scrollbar-src = {
      url = "github:petertriho/nvim-scrollbar";
      flake = false;
    };

    nvim-colorizer-src = {
      url = "github:NvChad/nvim-colorizer.lua";
      flake = false;
    };

    nvim-spectre-src = {
      url = "github:nvim-pack/nvim-spectre";
      flake = false;
    };

    plenary-src = {
      url = "github:nvim-lua/plenary.nvim";
      flake = false;
    };

    nvim-hlslens-src = {
      url = "github:kevinhwang91/nvim-hlslens";
      flake = false;
    };

    statuscol-nvim-src = {
      url = "github:luukvbaal/statuscol.nvim";
      flake = false;
    };

    promise-async-src = {
      url = "github:kevinhwang91/promise-async";
      flake = false;
    };

    nvim-lint-src = {
      url = "github:mfussenegger/nvim-lint";
      flake = false;
    };

    formatter-src = {
      url = "github:mhartington/formatter.nvim";
      flake = false;
    };

    dressing-src = {
      url = "github:stevearc/dressing.nvim";
      flake = false;
    };

  };

  outputs = {
    self,
    nixpkgs,
    nixvim,
    flake-utils,
    nvim-window-picker-src,
    nvim-comment-src,
    nvim-scrollbar-src,
    nvim-colorizer-src,
    nvim-spectre-src,
    plenary-src,
    nvim-hlslens-src,
    statuscol-nvim-src,
    promise-async-src,
    nvim-lint-src,
    formatter-src,
    dressing-src,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages."${system}";
      nvim = nixvim.legacyPackages."${system}".makeNixvim {
        extraFiles = {
          lua = "./lua";
        };
        extraConfigLuaPost = "" + 
        "vim.api.nvim_command('set runtimepath^=${self}') \n" +
        "vim.api.nvim_command('let &packpath = &runtimepath') \n" +
        ''
        if(not vim.g.vscode) then
          require('settings/global')
          require('settings/mapping')
          require('plugin-list')

        end

        if(vim.g.vscode) then
          require('settings/global')
          require('settings/mapping')
        end
        '' +
        "vim.wo.numberwidth = 4 -- columns number in gutter";

        
        # settings
        globals.mapleader = " "; # Sets the leader key to space
        globals.maplocalleader = " "; # Sets the leader key to space
        options = import "${self}/config/options.nix";
        globals.cursorholdUpdatetime = 100;
    


        maps = import "${self}/config/maps.nix";
        # colorscheme
        colorschemes.catppuccin.enable = true;
        colorschemes.catppuccin.flavour = "mocha";

        # lsp
        plugins.lsp.enable = true;
        plugins.nvim-lightbulb.enable = true;
        plugins.lsp.servers.tsserver.enable = true;
        plugins.lsp.servers.tailwindcss.enable = true;
        plugins.lsp.servers.html.enable = true;
        plugins.lsp.servers.jsonls.enable = true;
        plugins.lsp.servers.cssls.enable = true;
        plugins.lsp.keymaps.lspBuf = {
          K = "hover";
          gd = "definition";
          gD = "declaration";
          gi = "implementation";
          gt = "type_definition";
          gr = "references";
          gR = "rename";
          "<leader>la" = "code_action";
        };
        plugins.lsp.keymaps.diagnostic = {
          "<leader>ld" = "open_float";
          "<leader>[d" = "goto_prev";
          "<leader>]d" = "goto_next";
        };
        # clipboard
        clipboard.providers.xclip.enable = true;
        
        # statusline
        # plugins.lualine.enable = true;

        # which key
        plugins.which-key.enable = true;

        # fold code
        plugins.nvim-ufo.enable = true;

        # tabline
        plugins.bufferline.enable = true;

        # treesitter
        plugins.treesitter.enable = true;      

        plugins.ts-autotag.enable = true;
        plugins.treesitter-refactor.enable = true;
        plugins.ts-context-commentstring.enable = true;

        # telescope
        plugins.telescope.enable = true;


        # plugins
	      plugins.mini.enable = true;

        # git
	      plugins.gitsigns.enable = true;


        # filetree
        plugins.neo-tree.enable = true;

        # tmux
        plugins.tmux-navigator.enable = true;

        # harpoon
        plugins.harpoon.enable = true;

        # completion
        plugins.luasnip.enable = true;
        plugins.nvim-cmp.enable = true;
        plugins.cmp_luasnip.enable = true;
        plugins.cmp-buffer.enable = true;
        plugins.cmp-path.enable = true;
        plugins.cmp-nvim-lsp.enable = true;
        plugins.cmp-nvim-lsp-signature-help.enable = true;

        extraPlugins = [
          (pkgs.vimUtils.buildVimPlugin {
            name = "nvim-window-picker";
            src = nvim-window-picker-src;
          })

          (pkgs.vimUtils.buildVimPlugin {
            name = "nvim-comment";
            src = nvim-comment-src;
            buildPhase = ":"; # ignore build phase
          })

          (pkgs.vimUtils.buildVimPlugin {
            name = "nvim-scrollbar";
            src = nvim-scrollbar-src;
            buildPhase = ":"; # ignore build phase
          })

          (pkgs.vimUtils.buildVimPlugin {
            name = "nvim-colorizer";
            src = nvim-colorizer-src;
            buildPhase = ":"; # ignore build phase
          })

          (pkgs.vimUtils.buildVimPlugin {
            name = "nvim-spectre";
            src = nvim-spectre-src;
            buildPhase = ":"; # ignore build phase
          })

          (pkgs.vimUtils.buildVimPlugin {
            name = "plenary.nvim";
            src = plenary-src;
            buildPhase = ":"; # ignore build phase
          })

          (pkgs.vimUtils.buildVimPlugin {
            name = "hlslens";
            src = nvim-hlslens-src;
            buildPhase = ":"; # ignore build phase
          })
         (pkgs.vimUtils.buildVimPlugin {
            name = "statuscol.nvim";
            src =  statuscol-nvim-src;
            buildPhase = ":"; # ignore build phase
          })

         (pkgs.vimUtils.buildVimPlugin {
            name = "promise-async";
            src = promise-async-src;
            buildPhase = ":"; # ignore build phase
          })


         (pkgs.vimUtils.buildVimPlugin {
            name = "nvim-lint";
            src = nvim-lint-src;
            buildPhase = ":"; # ignore build phase
          })

          (pkgs.vimUtils.buildVimPlugin {
            name = "formatter.nvim";
            src = formatter-src;
            buildPhase = ":"; # ignore build phase
          })

          (pkgs.vimUtils.buildVimPlugin {
            name = "dressing.nvim";
            src = dressing-src;
            buildPhase = ":"; # ignore build phase
          })
          pkgs.vimPlugins.nvim-treesitter.withAllGrammars

          # pkgs.vimPlugins.codeium-vim

          # pkgs.vimPlugins.ChatGPT-nvim
          pkgs.vimPlugins.nui-nvim
        ];

        # neovim dependancies
        extraPackages = [
          pkgs.ripgrep
          pkgs.curl
          # pkgs.nodePackages_latest.prettier
        ];
      };
    in {
      packages = {
        inherit nvim;
        default = nvim;
      };
    });
}
