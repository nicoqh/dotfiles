-- Some nice color schemes:
-- catppuccin, tokyonight, nightfox, doom one, edge, material

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Before all other start plugins
    config = function()
      require("catppuccin").setup({
        dim_inactive = {
          enabled = true,    -- Dims the background of inactive window
          shade = "dark",
          percentage = 0.10, -- Percentage of the shade to apply to the inactive window
        },
        intergrations = {
          --
        }
      })

      vim.cmd([[colorscheme catppuccin-macchiato]])
    end,
  },
  { "folke/tokyonight.nvim",  lazy = true },
  { "EdenEast/nightfox.nvim", lazy = true },
  { "navarasu/onedark.nvim",  lazy = true },
}
