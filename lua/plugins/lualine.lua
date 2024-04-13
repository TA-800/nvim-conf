-- https://github.com/zbirenbaum/copilot.lua/issues/121#issuecomment-1431285247

-- Copilot status setup
local init = false

local status = ""
local setup = function()
    local api = require('copilot.api')
    api.register_status_notification_handler( function(data)
        -- customize your message however you want
        if data.status == 'Normal' then
            status = ''
        elseif data.status == 'InProgress' then
            status = '󱞇'
        else
            status = '' -- might never actually be nil but just in case
        end
    end )
end

local get_status = function()
    if not init then
        setup()
        init = true
    end
    return status
end


-- https://github.com/jonahgoldwastaken/copilot-status.nvim#example-with-lualine
config = {
    options = {
        theme = 'gruvbox-material',
        component_separators = "",
        section_separators = "",
    },
    sections = {
        lualine_x = { get_status, "filetype" }
    },
    extensions = {
        'toggleterm',
        'nvim-dap-ui',
    }

}

return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = config,
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    }
}
