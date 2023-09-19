{
  # 
  normal."<leader><leader>" = {
    silent = true;
    action = "<Cmd>e# <CR>";
    desc = "See previous file";
  };
  normal."<Space>" = {
    silent = true;
    action = "<Nop";
    desc = "Clear highlight";
  };
  normal."k" = {
    silent = true;
    action = "v:count == 0 ? 'gk' : 'k'";
    expr = true;
  };

  normal."j" = {
    silent = true;
    action = "v:count == 0 ? 'gj' : 'j'";
    expr = true;
  };
  
  # neo-tree
  normal."<leader>fe" = {
    silent = true;
    action = "<Cmd>Neotree toggle source=filesystem reveal<CR>";
    desc = "Toggle [F]iles [E]xplorer";
  };
  normal."<leader>bl" = {
    silent = true;
    action = "<Cmd>Neotree toggle source=buffers reveal<CR>";
    desc = "Toggle [B]uffer [L]ist";
  };
  normal."<leader>gs" = {
    silent = true;
    action = "<Cmd>Neotree toggle source=git_status<CR>";
    desc = "Toggle [G]it [S]tatus";
  };

  # comment
  normal."<M-/>" = {
    silent = true;
    action = "gcc";
    desc = "Toggle Comment";
  };
  visual."<M-/>" = {
    silent = true;
    action = "gc";
    desc = "Toggle Comment";
  };

  # telescope  
  normal."<leader>ff" = {
    silent = true;
    action = "<CMD> Telescope find_files <CR>";
    desc = "[F]ind [F]iles";
  };
  normal."<leader>fg" = {
    silent = true;
    action = "<CMD> Telescope live_grep <CR>";
    desc = "[F]ind with [G]rep";
  };
  normal."<leader>?" = {
    silent = true;
    action = "<CMD> Telescope keymaps <CR>";
    desc = "Show keymaps";
  };
  normal."<leader>gh" = {
    silent = true;
    action = "<CMD> Telescope git_commits <CR>";
    desc = "Show [G]it [H]istory";
  };
    normal."<leader>gb" = {
    silent = true;
    action = "<CMD> Telescope git_branches <CR>";
    desc = "Select [G]it [B]ranches";
  };
}
