-- https://github.com/stevearc/resession.nvim

return {
  'stevearc/resession.nvim',
  opts = {},
  config = function()
    local resession = require('resession')

    resession.setup()

    -- Keymaps
    vim.keymap.set('n', '<leader>sa', resession.save, { desc = 'Create session ' })
    vim.keymap.set('n', '<leader>sl', resession.load, { desc = 'Load session ' })
    vim.keymap.set('n', '<leader>sd', resession.delete, { desc = 'Delete session ' })
    vim.keymap.set('n', '<leader>sf', resession.list, { desc = 'List sessions ' })

    vim.api.nvim_create_autocmd("VimLeavePre", {
      callback = function()
        -- Always save a special session named "last"
        resession.save("last")
      end,
    })
  end,
}
