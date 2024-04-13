require("settings.options") -- global options
require("settings.mappings") -- global mappings
require("plugin") -- plugin.lua that will load plugins ( require "plugins" )
require("plugins_config") -- After-load configuration of plugins

-- TODO:
-- ensure that plugins like fzf are using optional dependencies (ripgrep, fd)
-- nvim-possesion (session manager built on fzf)
-- replace conform with mfussenegger/linter
-- get rid of snippets (so many of them)
