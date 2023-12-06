return {
  'lewis6991/gitsigns.nvim',
  config = function()
    -- Always show the sign column (avoid "content jump")
    vim.opt.signcolumn = "yes"

    require("gitsigns").setup {
      update_debounce = 200,

      -- Taken from https://github.com/lewis6991/gitsigns.nvim
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true })

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true })

        -- Actions
        map('n', '<leader>gs', gs.stage_hunk, { desc = 'Stage hunk' })
        map('n', '<leader>gr', gs.reset_hunk, { desc = 'Reset hunk' })
        map('v', '<leader>gs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        map('v', '<leader>gr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        map('n', '<leader>gS', gs.stage_buffer, { desc = 'Stage buffer' })
        map('n', '<leader>gu', gs.undo_stage_hunk, { desc = 'Undo stage hunk' })
        map('n', '<leader>gR', gs.reset_buffer, { desc = 'Reset buffer' })
        map('n', '<leader>gp', gs.preview_hunk, { desc = 'Preview hunk' })

        map('n', '<leader>gb', function() gs.blame_line { full = true } end, { desc = 'Blame line' })

        map('n', '<leader>gd', gs.diffthis, { desc = 'diffthis' })
        map('n', '<leader>gD', function() gs.diffthis('~') end)

        -- Toggles
        map('n', '<leader>gtd', gs.toggle_deleted, { desc = 'Toggle deleted' })
        map('n', '<leader>gtb', gs.toggle_current_line_blame, { desc = 'Toggle current line blame' })
        map('n', '<leader>gts', gs.toggle_signs, { desc = 'Toggle signs' })
        map('n', '<leader>gtn', gs.toggle_numhl, { desc = 'Toggle highlight number' })
        map('n', '<leader>gtl', gs.toggle_linehl, { desc = 'Toggle highlight line' })
        map('n', '<leader>gtw', gs.toggle_word_diff, { desc = 'Toggle word diff' })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end
    }
  end
}
