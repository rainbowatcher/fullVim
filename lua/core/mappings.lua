local keymaps = {
  n = {
    { ";",        ":" },
    { "<M-Up>",   "ddkP" },
    { "<M-Down>", "ddp" },
    { "<M-j>",    "ddp" },
    { "<M-k>",    "ddkP" },
    { "<M-z>",    ":set wrap! <CR>" },
    { "<D-e>",    ":NvimTreeToggle <CR>",                                    { silent = true } },
    { "<D-z>",    "u" },
    { "<Esc>",    ":noh <CR>",                                               { silent = true } }, -- disable highlighting
    -- Better window movement
    { "<C-h>",    "<c-w>h" },
    { "<C-j>",    "<c-w>j" },
    { "<C-k>",    "<c-w>k" },
    { "<C-l>",    "<c-w>l" },
    -- nvterm
    -- stylua: ignore
    { "<C-`",     function() require("nvterm.terminal").new "horizontal" end },
    { "<S-h>",    "<cmd>BufferLineCyclePrev<cr>",                            { desc = "Prev buffer" } },
    { "<S-l>",    "<cmd>BufferLineCycleNext<cr>",                            { desc = "Next buffer" } },
    { "<D-s>",    ":w <CR>",                                            { silent = true } },
  },
  i = {
    { "jj",     "<Esc>" },
    { "<D-v>",  "<esc>pa",      { silent = true } },
    { "<D-z>",  "<esc>ua",      { silent = true } },
    { "<M-BS>", "<esc>bdwi",    { silent = true } },
    { "<D-s>",  "<esc>:w <CR>", { silent = true } },
  },
  v = {
    { "D-c",   "y" },
    { "<D-s>", "<esc>:w <CR>", { silent = true } },
  },
}

for mode, maps in pairs(keymaps) do
  for _, value in ipairs(maps) do
    -- mode, key command { silent: boolean, buffer: int | boolean }
    pcall(vim.api.nvim_del_keymap, mode, value[1])
    vim.keymap.set(mode, value[1], value[2], value[3])
  end
end

vim.keymap.set({ "n", "i", "s" }, "<c-f>", function()
  if not require("noice.lsp").scroll(4) then
    return "<c-f>"
  end
end)
