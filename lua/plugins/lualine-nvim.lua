    require('lualine').setup {
      -- ... your lualine config
      options = {
        theme = l,
        globalstatus = true,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {'NvimTree'},
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {{'filetype', icon_only = true},

          {
            'filename',
            path = 1,
            shorting_target = 5,
            file_status = true, -- displays file status (readonly status, modified status)

          }
        },
        lualine_c = {'branch', 'diff'},
        lualine_x = { 'diagnostics','encoding', 'fileformat','filetype'},
        lualine_y = {},
        lualine_z = {'location'}
      },

      -- winbar = { lualine_a = {'filename'}},
      -- inactive_winbar = { lualine_a = {'filename'}}
      -- ... your lualine config
    }
