vim.opt.termguicolors = true

return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    options = {
      offsets = {
        {
          filetype = "NvimTree",
          text = "NvimTree",
          text_align = "center"
        },
      },
    }
  },
}
