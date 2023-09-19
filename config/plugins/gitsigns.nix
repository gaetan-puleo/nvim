{
  enable = true;
  currentLineBlame = true; # Toggle with `:Gitsigns toggle_current_line_blame`
  currentLineBlameOpts = {
    virtText = true;
    virtTextPos = "eol"; # 'eol' | 'overlay' | 'right_align'
    delay = 0;
    ignoreWhitespace = false;
  };
}