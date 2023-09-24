vim.o.timeout = true
vim.o.timeoutlen = 300

local wk = require("which-key")
require("which-key").setup({
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
})

local leader_groups = {
  g = { name = 'git'},
  b = { name = 'buffers'},
  f = { name = 'files'},
  s = { name = 'search'},
  ['<space>'] = "which_key_ignore"
}

wk.register(leader_groudps, {buffer = bufnr, prefix = "<leader>"})
