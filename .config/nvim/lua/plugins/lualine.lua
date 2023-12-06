return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
      options = {
        icons_enabled = true,
        theme = 'auto', -- Attempt to load a theme for your colorscheme
      }
  },
}
