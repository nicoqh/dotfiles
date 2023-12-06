return {
  'folke/trouble.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('trouble').setup({
      position = "bottom"
    })

    vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end, { desc = "Toggle Trouble" })
    vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, { desc = "Trouble: workspace_diagnostics" })
    vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end, { desc = "Trouble: document_diagnostics" })
    vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end, { desc = "Trouble: quickfix" })
    vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end, { desc = "Trouble: loclist" })
    vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end, { desc = "Trouble: lsp_references" })
  end,
}
