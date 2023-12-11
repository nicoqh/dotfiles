return {
  'nvimdev/dashboard-nvim',
  enabled = false,
  event = 'VimEnter',
  config = function()
    require('dashboard').setup({
      theme = 'hyper',
      config = {
        week_header = {
          enable = true,
        },
        project = {
          enable = true,
          -- action = '',
        },
        shortcut = {
          {
            desc = '󰊳 Update Lazy',
            group = '@property',
            action = 'Lazy update',
            key = 'u',
          },
          {
            icon = " ",
            icon_hl = "@variable",
            desc = 'Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            desc = " Config",
            action = "e ~/.config/nvim/init.lua",
            key = "e",
          },
        },
      },
    })
  end,
  dependencies = { 'nvim-tree/nvim-web-devicons' }
}
