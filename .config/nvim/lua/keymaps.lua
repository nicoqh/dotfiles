----------------------------------------
-- Non-plugin specific keymaps
----------------------------------------

-- Saving and quitting
vim.keymap.set("n", "<CR>", vim.cmd.update)
vim.keymap.set("n", "<leader>s", vim.cmd.update, { desc = "Save (:update)" })
vim.keymap.set("n", "<leader>q", vim.cmd.q, { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", vim.cmd.qall, { desc = "Quit all" })

-- Split navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Search
vim.keymap.set("n", "<BS>", ":noh<CR>", { desc = "Clear search highlight" })

-- Quick exit to normal mode
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "jj", "<Esc>")

-- Move lines up and down (in normal and visual mode)
vim.keymap.set("n", "<A-j>", ":m .+1<CR>")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- Buffers
vim.keymap.set("n", "<leader>bn", ":enew<CR>", { desc = "New buffer" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", { desc = "Previous buffer" })

-- Tabs
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>td", ":tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab" })

-- Terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>") -- Consider <Esc><Esc>
