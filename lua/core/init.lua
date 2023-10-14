-- ================== lazy.nvim ==================
-- ~/.local/share/nvim + /lazy/lazy.nvim/
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local options = require("core.options")
options.setup()
require("lazy").setup("plugins")

-- ================== load modules ==================
require("core.mappings")
require("onedark").load()
vim.cmd("colorscheme onedark")


