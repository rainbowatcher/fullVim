local autocmd = vim.api.nvim_create_autocmd

local pattern = vim.tbl_map(function(path)
  return vim.fs.normalize(vim.loop.fs_realpath(path))
end, vim.fn.glob(vim.fn.stdpath("config"):gsub("\\", "/") .. "/lua/**/*.lua", true, true, true))

local write_config = vim.api.nvim_create_augroup("ReloadFullVim", {})
autocmd("BufWritePost", {
  group = write_config,
  pattern = pattern,
  desc = "Trigger Reload on changing config",
  callback = function(args)
    vim.notify("Trigger Reload on changing config")
    -- if #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }) == 0 then
      local file = vim.split(args.file, "lua/core/", { true, false })[2]
      vim.notify(file)
      -- local config = "core." .. vim.split(file, ".lua", { true, false })[1]
      -- require("plenary").reload_module(config)
    -- else
    --   vim.notify("config check failed")
    -- end
  end,
})


vim.o.autoread = true
autocmd({ "BufWritePost", --[[ "CursorHold", "CursorHoldI", "FocusGained" ]] }, {
	-- command = "if mode() != 'c' | checktime | endif",
  callback = function(args)
    if args.mode ~= 'c' then
      vim.cmd("checktime")
      vim.notify(args.file .. " has changed")
    end
  end,
	pattern = { "*" },
})