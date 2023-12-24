----------------------------------------
-- Non-plugin specific keymaps
----------------------------------------

local keymap = vim.keymap

-- Saving and quitting
keymap.set("n", "<CR>", vim.cmd.update)
vim.keymap.set("n", "<leader>w", vim.cmd.update, { desc = "Save (:update)" })
keymap.set("n", "<leader>q", vim.cmd.q, { desc = "Quit" })
keymap.set("n", "<leader>Q", vim.cmd.qall, { desc = "Quit all" })

-- Movement
-- Move and center cursor while moving half a page
keymap.set('n', '<C-d>', '<C-d>zz', { noremap = false })
keymap.set('n', '<C-u>', '<C-u>zz', { noremap = false })
keymap.set('v', '<C-d>', '<C-d>zz', { noremap = false })
keymap.set('v', '<C-u>', '<C-u>zz', { noremap = false })
-- Alternative:
--keymap.set('n', '<C-d>', 'Lzz')
--keymap.set('n', '<C-u>', 'Hzz')

-- Split navigation
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- Adjust split sizes
keymap.set("n", "<C-left>", ":vertical resize -3<CR>")
keymap.set("n", "<C-right>", ":vertical resize +3<CR>")
keymap.set("n", "<C-up>", ":resize +3<CR>")
keymap.set("n", "<C-down>", ":resize -3<CR>")

-- Search
keymap.set("n", "<BS>", ":noh<CR>", { desc = "Clear search highlight" })
keymap.set('n', 'n', 'nzzzv') -- Center search result
keymap.set('n', 'N', 'Nzzzv') -- Center search result

-- Undo
keymap.set('n', 'U', '<C-r>') -- Redo

-- Quick exit to normal mode
keymap.set("i", "jk", "<Esc>")
keymap.set("i", "jj", "<Esc>")

-- Move lines up and down (in normal and visual mode)
keymap.set("n", "<A-j>", ":m .+1<CR>")
keymap.set("n", "<A-k>", ":m .-2<CR>")
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Buffers
keymap.set("n", "<leader>bn", ":enew<CR>", { desc = "New buffer" })
keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })
keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<S-Tab>", ":bprev<CR>", { desc = "Previous buffer" })

-- Tabs
keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })
keymap.set("n", "<leader>td", ":tabclose<CR>", { desc = "Close tab" })
keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab" })

-- Terminal
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")
