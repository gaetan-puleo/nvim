vim.o.runtimepath = vim.o.runtimepath..',~/.config/snippets'

require("luasnip.loaders.from_vscode")
.load({ paths = { "~/.config/snippets" } })
