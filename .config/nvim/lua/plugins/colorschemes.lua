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
          -- https://github.com/catppuccin/nvim#integrations
          -- What highlight groups are being modifier:
          -- https://github.com/catppuccin/nvim/tree/main/lua/catppuccin/groups/integrations
          --
          -- Many of these are enabled by default.
          alpha = true,
          enabled = true,
          gitsigns = true,
          harpoon = true,
          lsp_trouble = false,
          markdown = true,
          mason = true,
          notify = true,
          nvimtree = true,
          telescope = {
            treesitter = true,
            treesitter_context = false,
            which_key = true,
          },
        }
      })

      vim.cmd([[colorscheme catppuccin-macchiato]])
    end,
  },
  { "folke/tokyonight.nvim",  lazy = true },
  { "EdenEast/nightfox.nvim", lazy = true },
  { "navarasu/onedark.nvim",  lazy = true },
}
