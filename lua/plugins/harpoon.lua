require("harpoon").setup()

vim.keymap.set('n', '<leader>a', '<Cmd>lua require("harpoon.mark").add_file()<CR>', {desc = '[H]arpoon [A]dd file'})
vim.keymap.set('n', '<leader>r', '<Cmd>lua require("harpoon.mark").rm_file()<CR>', {desc = 'Harpoon [R]emove file'})
vim.keymap.set('n', '<leader><leader>', '<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', {desc = 'Harpoon Toggle UI'})
vim.keymap.set('n', '<leader>1', '<Cmd>lua require("harpoon.ui").nav_file(1)<CR>', {desc = 'Harpoon file [1]'})
vim.keymap.set('n', '<leader>2', '<Cmd>lua require("harpoon.ui").nav_file(2)<CR>', {desc = 'Harpoon file [2]'})
vim.keymap.set('n', '<leader>3', '<Cmd>lua require("harpoon.ui").nav_file(3)<CR>', {desc = 'Harpoon file [3]'})
vim.keymap.set('n', '<leader>4', '<Cmd>lua require("harpoon.ui").nav_file(4)<CR>', {desc = 'Harpoon file [4]'})