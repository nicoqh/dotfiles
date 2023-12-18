-- Requires `hidden`, otherwise the terminals will be discarded when closed.

return {
  {
    'akinsho/toggleterm.nvim',
    cmd = { "ToggleTerm", "TermExec" },
    init = function()
      vim.keymap.set("n", "<F7>", ":ToggleTerm<CR>", { desc = "ToggleTerm" })
      vim.keymap.set("n", "<leader><CR>", ":ToggleTerm direction=float<CR>", { desc = "ToggleTerm" })
      vim.keymap.set("n", "<leader><CR><CR>", ":ToggleTerm direction=float<CR>", { desc = "ToggleTerm" })
      vim.keymap.set("n", "<leader><CR>h", ":ToggleTerm size=10 direction=horizontal<CR>", { desc = "ToggleTerm horiz" })
      vim.keymap.set("n", "<leader><CR>v", ":ToggleTerm size=80 direction=vertical<CR>", { desc = "ToggleTerm vert" })
      vim.keymap.set("n", "<leader><CR>l", ":TermSelect<CR>", { desc = "TermSelect" })
      vim.keymap.set("n", "<leader><CR>n", ":ToggleTermSetName<CR>", { desc = "ToggleTermSetName" })

      -- Custom commands
      vim.api.nvim_create_user_command('TermNpmTest', function() require('toggleterm').exec('npm run test') end, {})
      vim.api.nvim_create_user_command('TermNpmCheckUpdates',
        function() require('toggleterm').exec('npx npm-check-updates -i --format group') end, {})
    end,
    config = function()
      require('toggleterm').setup({
        size = 10,
        open_mapping = [[<F7>]],
        direction = "float",
        float_opts = {
          border = "rounded",
        },
      })

      -- Navigate like normal windows
      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<esc><esc>', [[<C-\><C-n>]], opts) -- TODO: also in keymaps.lua
        --vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      end

      vim.api.nvim_create_autocmd("TermOpen", {
        -- If you only want these mappings for ToggleTerm use term://*toggleterm#* instead
        pattern = "term://term*",
        callback = function()
          set_terminal_keymaps()
        end
      })
    end,
  }
}
