-- Recommended by nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

----------------------------------------------
-- lazy.nvim
----------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- Set `mapleader` before lazy.nvim
vim.g.mapleader = " "

require("lazy").setup("plugins", {
  -- Lazy config
  ui = {
    border = "rounded",
  },
})
require("options")
require("keymaps")
