{
  clipboard = "unnamedplus";
  # Enable break indent
  breakindent = true;

  # Save undo history
  undofile = true;

  # Case insensitive searching UNLESS /C or capital in search
  ignorecase = true;
  smartcase = true;

  # Decrease update time
  updatetime = 250;
  timeout = true;
  timeoutlen = 300;

  # Set completeopt to have a better completion experience
  completeopt = "menuone,noselect";

  # NOTE: You should make sure your terminal supports this
  termguicolors = true;

  # enable local .nvimrc
  exrc = true;
  secure = true;

  # one tab is equal 2 spaces
  # to customize the spacing locally, create an .editorconfig file for your project
  expandtab = true;
  shiftwidth = 2;
  tabstop = 2;
  softtabstop = 2;

  belloff = "all"; # disable alerts

  splitbelow = true; # Horizontal splits will automatically be below
  splitright = true; # Vertical splits will automatically be to the right

  backup = false; # Disable backup
  swapfile = false; # Disable swapfile

  autowrite = true; # Autosave when changing buffer
  hidden = true; #Required to keep multiple buffers open

  showmode = false; # We don't need to see things like -- INSERT -- anymore

  cmdheight = 2; # cmd line height

  # Set highlight on search
  hlsearch = true;
  incsearch = true;

  # Incremental live completion
  inccommand = "nosplit";

  listchars = { eol = "↵"; trail = "~"; tab = ">-"; nbsp = "␣"; space = "_"; };

  foldenable = true;
  fillchars = "eob: ,fold: ,foldopen:▼,foldsep: ,foldclose:⏵";
  foldlevel = 99;
  foldcolumn = "1";
  foldlevelstart = 99;



}