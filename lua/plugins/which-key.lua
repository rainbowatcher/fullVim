return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    window = {
      border = "single",        -- none, single, double, shadow
      position = "bottom",      -- bottom, top
      margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
      padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0,
    },
  },
  config = function()
    local wk = require("which-key")
    wk.register({
      b = {
        name = "Buffer",
        p = { "<Cmd>BufferLineTogglePin<CR>", "Toggle pin" },
        P = { "<Cmd>BufferLineGroupClose ungrouped<CR>", "Delete non-pinned buffers" },
        o = { "<Cmd>BufferLineCloseOthers<CR>", "Delete other buffers" },
        r = { "<Cmd>BufferLineCloseRight<CR>", "Delete buffers to the right" },
        l = { "<Cmd>BufferLineCloseLeft<CR>", "Delete buffers to the left" },
        c = { function(n) require("mini.bufremove").delete(n, false) end, "Close current bufffer"},
        n = { "<cmd>tabnew<CR>", "New empty buffer" },
      },
      c = {
        name = "Code",
        ["<Up>"] = { "ddkP", "Move line up" },
        ["<Down>"] = { "ddp", "Mode line down" },
        ["w"] = { ":set wrap! <CR>", "Toggle line wrap" },
      },
      d = {
        name = "Developer",
        -- stylua: ignore
        r = { function() require("plenary.reload").reload_module(vim.fn.stdpath("config") .. "init.lua") end,
          "Reload config" },
      },
      e = {
        name = "Edit",
        u = { "u", "Undo" },
        r = { "<C-r>", "Redo" },
      },
      f = {
        name = "File", -- optional group name
        -- f = { "<cmd>Telescope find_files<cr>", "Find File" }, -- create a binding with label
        -- r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
        n = { "New File" },                           -- just a label. don't create any mapping
        -- e = "Edit File", -- same as above
        ["1"] = "which_key_ignore",                   -- special label to hide it in the popup
        -- stylua: ignore
        b = { function() print("bar") end, "Foobar" } -- you can also pass functions!
      },
      n = {
        name = "Notifications",
        h = { ":Noice history <CR>", "Show notification history" }
      },
      N = {
        name = "Notifications",
        h = { ":Noice history <CR>", "Show notification history" }
      },
      q = {
        name = "Quit",
        q = { ":quitall <CR>", "Quit all" },
        b = { ":quit! <CR>", "Close current buffer" }
      },
      s = {
        name = "Selection",
      },
      v = {
        name = "View",
        e = { ":NvimTreeToggle <CR>", "Toggle Explorer" },
        -- stylua: ignore
        t = { function() require("nvterm.terminal").new "horizontal" end, "New horizontal term" }
      },
    }, { mode = "n", prefix = "<leader>" })
  end
}
