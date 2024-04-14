require("settings.options") -- global options
require("plugin") -- plugin.lua that will load plugins ( require "plugins" )
require("plugins_config") -- After-load configuration of plugins
require("settings.mappings") -- global mappings

-- TODO:
-- ensure that plugins like fzf are using optional dependencies (ripgrep, fd)
-- conform vs mfussenegger/linter?
-- toggleterm + lazygit
