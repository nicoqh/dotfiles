return {
  'tamton-aquib/duck.nvim',
  config = function()
    vim.keymap.set('n', '<leader>dd', function() require("duck").hatch() end, { desc = "Hatch duck" })
    vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, { desc = "Cook duck" })
    vim.keymap.set('n', '<leader>da', function() require("duck").cook_all() end, { desc = "Cook all ducks" })
    vim.keymap.set('n', '<leader>db', function() require("duck").hatch("🐞") end, { desc = "Hatch bug" })
  end
}
