return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  config = function ()
    require("noice").setup()
    -- require("lualine").setup({
    --   sections = {
    --     lualine_x = {
    --       {
    --         require("noice").api.status.message.get_hl,
    --         cond = require("noice").api.status.message.has,
    --       },
    --       {
    --         require("noice").api.status.command.get,
    --         cond = require("noice").api.status.command.has,
    --         color = { fg = "#ff9e64" },
    --       },
    --       {
    --         require("noice").api.status.mode.get,
    --         cond = require("noice").api.status.mode.has,
    --         color = { fg = "#ff9e64" },
    --       },
    --       {
    --         require("noice").api.status.search.get,
    --         cond = require("noice").api.status.search.has,
    --         color = { fg = "#ff9e64" },
    --       },
    --     },
    --   },
    -- })
  end,
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    "nvim-lualine/lualine.nvim"
  }
}
