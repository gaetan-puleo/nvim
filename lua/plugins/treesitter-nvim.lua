require'nvim-treesitter.configs'.setup {
  -- sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  autotag = {
		enable = true
	},
	context_commentstring = {
		enable = true,
		-- config = {
		-- 	javascript = {
		-- 		__default = '// %s',
		-- 		jsx_element = '{/* %s */}',
		-- 		jsx_fragment = '{/* %s */}',
		-- 		jsx_attribute = '// %s',
		-- 		comment = '// %s'
		-- 	}
		-- }
  },
	refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = false },
  },
	highlight = {
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
    enable = true,
    use_languagetree = true,
    --additional_vim_regex_highlighting = true,
  }
}
