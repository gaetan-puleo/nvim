require("neotest").setup({
  adapters = {
      require('neotest-jest')({
        jestCommand = "npm test --",
        jestConfigFile = "jest.config.ts",
        env = { CI = true, NODE_ENV = "test" },
        cwd = function(path)
          return vim.fn.getcwd()
        end,
      }),
  },
})

local map = vim.api.nvim_set_keymap

vim.keymap.set('n', '<leader>tf', "<Cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", {desc = '[T]est [F]ile'})
vim.keymap.set('n', '<leader>tn', "<Cmd>lua require('neotest').run.run())<CR>", {desc = '[T]est [N]earest'})
vim.keymap.set('n', '<leader>ts', "<Cmd>Neotest summary <CR>", {desc = '[T]oggle [S]ummary'})
