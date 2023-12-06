return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
  init = function()
    vim.keymap.set("n", "<F2>", ":NvimTreeToggle<CR>")
    vim.keymap.set("n", "<F3>", ":NvimTreeFindFile<CR>")
  end,
  config = function()
    require("nvim-tree").setup({
      filters = {
        git_ignored = false,
      },
      on_attach = function(bufnr)
        local api = require "nvim-tree.api"

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- Default mappings
        api.config.mappings.default_on_attach(bufnr)

        -- Custom mappings
        vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
      end,
    })
  end,
}
