local map = vim.api.nvim_set_keymap

require('nvim_comment').setup({
comment_empty = false,
create_mappings = true,
})

vim.api.nvim_set_keymap('n', '<M-/>', ':CommentToggle<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<M-/>', ":'<,'>CommentToggle<CR>", {noremap = true, silent = true})