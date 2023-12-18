return {
  "adalessa/laravel.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "tpope/vim-dotenv",
    "MunifTanjim/nui.nvim",
  },
  cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
  keys = {
    { "<leader>la", ":Laravel artisan<cr>" },
    { "<leader>lr", ":Laravel routes<cr>" },
    { "<leader>lm", ":Laravel related<cr>" },
    {
      "<leader>lt",
      function()
        require("laravel.tinker").send_to_tinker()
      end,
      mode = "v",
      desc = "Laravel Application Routes",
    },
  },
  ft = 'php',
  config = function()
    require("laravel").setup({
      lsp_server = "intelephense",
    })

    require("telescope").load_extension "laravel"
  end,
}
