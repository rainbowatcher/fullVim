local M = {}
-- this module is first order load at vim startup.

local options = {
  -- display
  wrap = false, -- Do not wrap lines
  number = true, -- Enable line number display
  syntax = "on", -- Enable syntax highlighting
  hlsearch = true, -- highlight all matches on previous search pattern
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  termguicolors = true, -- set term gui colors (most terminals support this)
  cursorline = true, -- highlight the current line
  guifont = "FiraCode Nerd Font:h13", -- the font used in graphical neovim applications
  -- behavious
  mouse = "a", -- allow the mouse to be used in neovim
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  -- tabs and whitespaces
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  tabstop = 2, -- insert 2 spaces for a tab
  -- search
  ignorecase = true, -- ignore case in search patterns
  smartcase = true, -- smart case
  -- file
  swapfile = false, -- creates a swapfile
  backup = false, -- creates a backup file
  writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  fileencoding = "utf-8", -- the encoding written to a file
  fileencodings = "utf-8,gbk,gb2312,ucs-bom,cp1252,default,latin9",
  -- configurations
  timeoutlen = 300, -- time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 100, -- faster completion
  -- cmdheight = 1, -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect", "noinsert" },
}

local globalOptions = {
  mapleader = " ", -- map the leader key to space
  -- It is strongly advised to eagerly disable netrw, due to race conditions at vim startup. -- nvim-tree
  loaded_netrw = 1, -- disable the netrw
  loaded_netrwPlugin = 1, -- disable the netrw
}

M.load_default_options = function()
  for k,v in pairs(globalOptions) do
    vim.g[k] = v
  end

  for k,v in pairs(options) do
    vim.opt[k] = v
  end
end

vim.opt.spelllang:append "cjk" -- disable spellchecking for asian characters (VIM algorithm does not support it)
vim.opt.shortmess:append "c" -- don't show redundant messages from ins-completion-menu
vim.opt.shortmess:append "I" -- don't show the default intro message
vim.opt.whichwrap:append "<,>,[,],h,l"


M.load_headless_options = function()
  vim.opt.shortmess = "" -- try to prevent echom from cutting messages off or prompting
  vim.opt.more = false -- don't pause listing when screen is filled
  vim.opt.cmdheight = 9999 -- helps avoiding |hit-enter| prompts.
  vim.opt.columns = 9999 -- set the widest screen possible
  vim.opt.swapfile = false -- don't use a swap file
end

M.setup = function()
  -- is there no neovim instance is running
  if #vim.api.nvim_list_uis() == 0 then
    M.load_headless_options()
    return
  end
  M.load_default_options()
end

return M