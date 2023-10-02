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
