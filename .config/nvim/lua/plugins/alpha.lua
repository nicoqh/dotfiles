return {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VimEnter',
  config = function()
    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    local logo = {
      '       ███████████           █████      ██',
      '      ███████████             █████ ',
      '      ████████████████ ███████████ ███   ███████',
      '     ████████████████ ████████████ █████ ██████████████',
      '    ██████████████    █████████████ █████ █████ ████ █████',
      '  ██████████████████████████████████ █████ █████ ████ █████',
      ' ██████  ███ █████████████████ ████ █████ █████ ████ ██████',
    }

    dashboard.section.header.val = logo

    dashboard.section.buttons.val = {
      dashboard.button("s", "  Sessions", ":lua require('resession').load()<CR>"),
      dashboard.button("f", "  Find file", ":lua require('telescope.builtin').find_files()<CR>"),
      dashboard.button("g", "  Grep", ":lua require('telescope.builtin').live_grep()<CR>"),
      dashboard.button("l", "󰊳  Lazy", ":Lazy<CR>"),
      dashboard.button("m", "  Mason", ":Mason<CR>"),
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("c", "  config (init.lua)", ":e ~/.config/nvim/init.lua<CR>"),
      dashboard.button("q", "󰅚  Quit", ":qa<CR>"),

    }

    dashboard.section.footer.val = os.date("%A")

    table.insert(dashboard.config.layout, 5, {
      type = 'padding',
      val = 1,
    })

    alpha.setup(dashboard.config)
  end
};
