-- local custom_route_provider = {}
--
-- local route_info_view = {}
--
-- function route_info_view:get(route)
--   return {
--     virt_text = {
--       { "[",                              "comment" },
--       { table.concat(route.methods, "|"), "comment" },
--       { " ",                              "comment" },
--       { route.uri,                        "@enum" },
--       { "]",                              "comment" },
--     },
--   }
-- end
--
-- function custom_route_provider:register(app)
--   app:instance("route_info_view", route_info_view)
-- end

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
