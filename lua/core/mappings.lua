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
    { "<c-h>",    "<c-w>h" },
    { "<c-j>",    "<c-w>j" },
    { "<c-k>",    "<c-w>k" },
    { "<c-l>",    "<c-w>l" },
    -- nvterm
    -- stylua: ignore
    { "<c-`",     function() require("nvterm.terminal").new "horizontal" end },
    { "<S-h>",    "<cmd>BufferLineCyclePrev<cr>",                            { desc = "Prev buffer" } },
    { "<S-l>",    "<cmd>BufferLineCycleNext<cr>",                            { desc = "Next buffer" } },
  },
  i = {
    { "jj", "<Esc>" }
  },
  v = {
    -- { "<A-Up", ":m'>+<cr>`<my`>mzgv`yo`z" },
    -- { "<A-Down", ":m'<-2<cr>`>my`<mzgv`yo`z" },
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
