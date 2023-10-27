return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  cmd = { "NvimTreeToggle" },
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    on_attach = "default",                     -- Runs when creating the nvim-tree buffer. Use this to set your nvim-tree
    hijack_cursor = true,                      -- Keeps the cursor on the first letter of the filename when moving in the tree. Default: `false`
    auto_reload_on_write = true,               -- Reloads the explorer every time a buffer is written to. Default: `true`
    disable_netrw = true,                      -- Completely disable netrw. Default: `false`
    hijack_netrw = false,                      -- Hijack netrw windows (overridden if |disable_netrw| is `true`) Default: `true`
    hijack_unnamed_buffer_when_opening = true, -- Opens in place of the unnamed buffer if it's empty. Default: `false`
    root_dirs = {},                            -- Preferred root directories. Only relevant when `update_focused_file.update_root` is `true` Default: `{}`
    -- Prefer startup root directory when updating root directory of the tree.
    -- Only relevant when `update_focused_file.update_root` is `true`, Default: `false`
    prefer_startup_root = false,
    sync_root_with_cwd = true, -- Changes the tree root directory on `DirChanged` and refreshes the tree. Default: `false`
    reload_on_bufenter = false, -- Automatically reloads the tree on `BufEnter` nvim-tree. Default: `false`
    respect_buf_cwd = false,    -- Will change cwd of nvim-tree to that of new buffer's when opening nvim-tree. Default: `false`
    -- sort_by = "name", @deprecated
    sort = {
      -- Can be one of `"name"`, `"case_sensitive"`, `"modification_time"`, `"extension"`, `"suffix"`, `"filetype"` or a function. 
      -- `"extension"` uses all suffixes e.g. `foo.tar.gz` -> `.tar.gz` `"suffix"` uses the last e.g. `.gz`, Default: `"name"`
      sorter = "name",
      folders_first = true, -- Sort folders before files. Has no effect when |nvim-tree.sort.sorter| is a function. Default: `true`
      -- Sort files before folders. Has no effect when |nvim-tree.sort.sorter| is a function. 
      -- If set to `true` it overrides |nvim-tree.sort.folders_first|. Default: `false`
      files_first = false,
    },
    view = {
      centralize_selection = true, -- When entering nvim-tree, reposition the view so that the current node is initially centralized, see |zz|. Default: `false`
      cursorline = true, -- Enable |cursorline| in the tree window. Default: `true`
      debounce_delay = 15, -- Idle milliseconds before some reload / refresh operations. Default: `15` (ms)
      side = "left", -- Side of the tree, can be `"left"`, `"right"`. Default: `"left"`
      preserve_window_proportions = false, -- Preserves window proportions when opening a file. If `false`, the height and width of windows other than nvim-tree will be equalized. Default: `false`
      number = false, -- Print the line number in front of each line. Default: `false`
      relativenumber = false, -- Show the line number relative to the line with the cursor in front of each line. Default: `false`
      signcolumn = "auto", -- Show |signcolumn|. Value can be `"yes"`, `"auto"`, `"no"`. Default: `"yes"`
      width = 30, -- Width of the window: can be a `%` string, a number representing columns, a function or a table.
      adaptive_size = false, -- @deprecated
      -- hide_root_folder = false,
      float = {
        enable = false, -- Tree window will be floating. Default: `false`
        quit_on_focus_loss = true, -- Default: `true`
        open_win_config = function ()
          local gheight = vim.api.nvim_list_uis()[1].height
          local gwidth = vim.api.nvim_list_uis()[1].width
          local width = 30
          local height = 30
          return {
              relative = "editor",
              width = width,
              border = "rounded",
              height = height,
              row = (gheight - height) * 0.5,
              col = (gwidth - width) * 0.5,
          }
        end
      },
    },
    select_prompts = false,
    renderer = {
      add_trailing = false,
      group_empty = false,
      highlight_git = true,
      full_name = false,
      highlight_opened_files = "none",
      root_folder_label = ":t",
      indent_width = 2,
      indent_markers = {
        enable = true,
        inline_arrows = true,
        icons = {
          corner = "└",
          edge = "│",
          item = "│",
          none = " ",
        },
      },
      -- icons = {
      --   webdev_colors = lvim.use_icons,
      --   git_placement = "before",
      --   padding = " ",
      --   symlink_arrow = " ➛ ",
      --   show = {
      --     file = lvim.use_icons,
      --     folder = lvim.use_icons,
      --     folder_arrow = lvim.use_icons,
      --     git = lvim.use_icons,
      --   },
      --   glyphs = {
      --     default = lvim.icons.ui.Text,
      --     symlink = lvim.icons.ui.FileSymlink,
      --     bookmark = lvim.icons.ui.BookMark,
      --     folder = {
      --       arrow_closed = lvim.icons.ui.TriangleShortArrowRight,
      --       arrow_open = lvim.icons.ui.TriangleShortArrowDown,
      --       default = lvim.icons.ui.Folder,
      --       open = lvim.icons.ui.FolderOpen,
      --       empty = lvim.icons.ui.EmptyFolder,
      --       empty_open = lvim.icons.ui.EmptyFolderOpen,
      --       symlink = lvim.icons.ui.FolderSymlink,
      --       symlink_open = lvim.icons.ui.FolderOpen,
      --     },
      --     git = {
      --       unstaged = lvim.icons.git.FileUnstaged,
      --       staged = lvim.icons.git.FileStaged,
      --       unmerged = lvim.icons.git.FileUnmerged,
      --       renamed = lvim.icons.git.FileRenamed,
      --       untracked = lvim.icons.git.FileUntracked,
      --       deleted = lvim.icons.git.FileDeleted,
      --       ignored = lvim.icons.git.FileIgnored,
      --     },
      --   },
      -- },
      special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
      symlink_destination = true,
    },
    hijack_directories = {
      enable = false,
      auto_open = true, -- Opens the tree if the tree was previously closed.
    },
    update_focused_file = {
      enable = true, -- Default: `false`
      debounce_delay = 15,
      update_root = false, -- Update the root directory of the tree if the file is not under current, Default: `false`
      ignore_list = {},
    },
    diagnostics = {
      -- enable = lvim.use_icons,
      show_on_dirs = false,
      show_on_open_dirs = true,
      debounce_delay = 50,
      severity = {
        min = vim.diagnostic.severity.HINT,
        max = vim.diagnostic.severity.ERROR,
      },
      -- icons = {
      --   hint = vim.icons.diagnostics.BoldHint,
      --   info = vim.icons.diagnostics.BoldInformation,
      --   warning = vim.icons.diagnostics.BoldWarning,
      --   error = vim.icons.diagnostics.BoldError,
      -- },
    },
    filters = {
      dotfiles = false,
      git_clean = false,
      no_buffer = false,
      custom = { "node_modules", "\\.cache" },
      exclude = {},
    },
    filesystem_watchers = {
      enable = true,
      debounce_delay = 50,
      ignore_dirs = {},
    },
    git = {
      enable = true,
      ignore = false,
      show_on_dirs = true,
      show_on_open_dirs = true,
      timeout = 200,
    },
    actions = {
      use_system_clipboard = true,
      change_dir = {
        enable = true,
        global = false,
        restrict_above_cwd = false,
      },
      expand_all = {
        max_folder_discovery = 300,
        exclude = {},
      },
      file_popup = {
        open_win_config = {
          col = 1,
          row = 1,
          relative = "cursor",
          border = "shadow",
          style = "minimal",
        },
      },
      open_file = {
        quit_on_open = false,
        resize_window = false,
        window_picker = {
          enable = true,
          picker = "default",
          chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
          exclude = {
            filetype = { "notify", "lazy", "qf", "diff", "fugitive", "fugitiveblame" },
            buftype = { "nofile", "terminal", "help" },
          },
        },
      },
      remove_file = {
        close_window = true,
      },
    },
    trash = {
      cmd = "trash",
      require_confirm = true,
    },
    live_filter = {
      prefix = "[FILTER]: ",
      always_show_folders = true,
    },
    tab = {
      sync = {
        open = false,
        close = false,
        ignore = {},
      },
    },
    notify = {
      threshold = vim.log.levels.INFO,
      absolute_path = true,
    },
    log = {
      enable = false,
      truncate = false,
      types = {
        all = false,
        config = false,
        copy_paste = false,
        dev = false,
        diagnostics = false,
        git = false,
        profile = false,
        watcher = false,
      },
    },
    system_open = {
      cmd = nil,
      args = {},
    },
  },
}
