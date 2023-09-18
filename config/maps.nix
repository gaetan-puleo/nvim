{
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
}
