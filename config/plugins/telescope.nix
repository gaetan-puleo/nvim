{
  enable = true;
  defaults = {
    mappings = {
      i = {
        "<esc>" = { __raw = "require('telescope.actions').close"; };
        "<C-j>" = { __raw = "require('telescope.actions').preview_scrolling_down"; };
        "<C-k>" = { __raw = "require('telescope.actions').preview_scrolling_up"; };
      };
      n = {
        "q" = {__raw = "require('telescope.actions').close";};
      };
    };
    

    pickers = {
      find_files = {
        sorting_strategy = "ascending";
        prompt_title = false;
        previewer = false;
        hidden = true;  # include hidden files
        ignore = true;  # include ignored files
        layout_strategy = "vertical";
        layout_config = {
          vertical = {
            anchor = "N"; # pin to top (N like nord)
            height = 0.5; # 0.1 equal 10%
            prompt_position = "top";
            width = 0.7; # 0.1 equal 10%
          };
        };
      };
    };
  };

}