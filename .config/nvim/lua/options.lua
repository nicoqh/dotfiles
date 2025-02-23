-- Misc options
vim.opt.ffs = "unix"
vim.opt.undolevels = 1000
vim.opt.encoding = "utf-8"
vim.opt.hidden = true -- Allow unwritten buffers that aren't visible
vim.opt.secure = true

-- Highlight current line and column
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.colorcolumn = "81"

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank {
      higroup = (vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout = 500
    }
  end
})

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 5
vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  callback = function()
    vim.opt_local.relativenumber = false
  end
})
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    vim.opt_local.relativenumber = true
  end
})

-- Jump to last position when opening a file
vim.api.nvim_create_autocmd(
  "BufReadPost",
  {
    callback = function()
      local row, col = unpack(vim.api.nvim_buf_get_mark(0, "\""))
      local last_row = vim.api.nvim_buf_line_count(0)
      if { row, col } ~= { 0, 0 } and row <= last_row then
        vim.api.nvim_win_set_cursor(0, { row, 0 })
      end
    end,
  }
)

-- Search
vim.opt.hlsearch = true   -- Highlight search
vim.opt.incsearch = true  -- Search as you type
vim.opt.ignorecase = true -- Ignore case in search and command completion
vim.opt.smartcase = true  -- Don't ignore case if uppercase letter

-- Swap and backup
vim.opt.backup = false

-- Splits and tabs
vim.opt.splitbelow = true -- Open splits below
vim.opt.splitright = true -- Open splits right

-- Indenting (default, overwritten for file types)
vim.opt.expandtab = true -- Replace tab with spaces
vim.opt.tabstop = 4      -- Display tab as 4 spaces
vim.opt.shiftwidth = 4   -- Replace tab with spaces
vim.opt.softtabstop = 4

-- Folding
vim.opt.foldenable = false                      -- Disable folding at startup.
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- Use treesitter

-- Show non-text characters
vim.opt.listchars = {
  tab = '· ',
  trail = '∑',
  extends = '>',
  multispace = '￮',
  lead = ' ',
  -- nbsp = '‿',
  nbsp = '⎵',
}
vim.opt.list = true

-- UI
vim.opt.scrolloff = 5
vim.opt.termguicolors = true

-- Diagnostics
vim.diagnostic.config({
  underline = true,
  signs = true,
  update_in_insert = true,
  virtual_text = true,
})

-- Diagnostics symbols for the sign column
vim.fn.sign_define("DiagnosticSignError", { texthl = "DiagnosticSignError", text = "✖", numhl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { texthl = "DiagnosticSignWarn", text = "❢", numhl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignHint", { texthl = "DiagnosticSignHint", text = "", numhl = "DiagnosticSignHint" })
vim.fn.sign_define("DiagnosticSignInfo", { texthl = "DiagnosticSignInfo", text = "𝓲", numhl = "DiagnosticSignInfo" })

vim.opt.virtualedit = "block" -- Virtual editing (cursor can be anywhere) in visual block mode
