local config = function()

    local dap, dapui = require("dap"), require("dapui")

    -- https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(gdb-via--vscode-cpptools)#configuration
    dap.configurations.cpp = {
        {
            name = "Launch file",
            type = "cppdbg",
            request = "launch",

            -- https://www.reddit.com/r/neovim/comments/13saiet/comment/jlpv1rk/?utm_source=share&utm_medium=web2x&context=3
            -- Doesn't work perfectly, when args are empty, it still passes something empty
            -- args = function()
            --     local args_string = vim.fn.input("Arguments (if any): ")
            --     return vim.split(args_string, " ")
            -- end,

            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopAtEntry = true,
            -- to view elements of containers (e.g. std::vector) while debugging
            setupCommands = {
                {
                    text = '-enable-pretty-printing',
                    description = 'enable pretty printing',
                    ignoreFailures = false
                },
            },
        }

    }

    dapui.setup()
    dap.listeners.before.attach.dapui_config = function() dapui.open() end
    dap.listeners.before.launch.dapui_config = function() dapui.open() end
    dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
    dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

end

return {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "rcarriga/nvim-dap-ui"
    },
    config = config
}
