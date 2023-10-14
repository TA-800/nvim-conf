require 'nvim-treesitter.install'.compilers = { "clang" }
require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  -- ensure_installed = { "c", "cpp", "java", "lua", "python" , "javascript", "typescript", "tsx", "html", "css", "json" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -- Auto pairs for nvim-treesitter
  matchup = {
    enable = true, -- mandatory, false will disable the whole extension
  },
  -- Autotag for nvim-treesitter (HTML, JSX, TSX)
  autotag = { enable = true },

  refactor = {
    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true,
    },
    -- smart_rename = {
    --   enable = true,
    --   -- Assign keymaps to false to disable them, e.g. `smart_rename = false`.
    --   keymaps = {
    --     smart_rename = "<F2>",
    --   },
    -- },
    -- Navigation keybinds already seem to be provided by language servers
    -- navigation = {
    --   enable = true,
    --   -- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
    --   keymaps = {
    --     goto_definition = "gnd",
    --     list_definitions = "gnD",
    --     list_definitions_toc = "gO",
    --     goto_next_usage = "<A-*>",
    --     goto_previous_usage = "<A-#>",
    --   },
    -- }
  },
}
