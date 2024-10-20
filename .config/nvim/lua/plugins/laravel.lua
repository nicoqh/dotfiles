return {
  "adalessa/laravel.nvim",
  dependencies = {
    "tpope/vim-dotenv",
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
    "kevinhwang91/promise-async",
  },
  cmd = { "Laravel" },
  keys = {
    { "<leader>la", ":Laravel artisan<cr>" },
    { "<leader>lr", ":Laravel routes<cr>" },
    { "<leader>lm", ":Laravel related<cr>" },
  },
  event = { "VeryLazy" },
  opts = {
    lsp_server = "intelephense",
    features = {
      route_info = {
        enable = true,
        view = "top",
      },
      model_info = {
        enable = true,
      },
      override = {
        enable = false,
      },
      pickers = {
        enable = true,
        provider = 'telescope',
      },
    },
  },
  config = true,
}
