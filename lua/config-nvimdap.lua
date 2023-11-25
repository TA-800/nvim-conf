local dap, dapui = require("dap"), require("dapui")

-- https://github.com/mfussenegger/nvim-dap/wiki/C-C---Rust-(gdb-via--vscode-cpptools)#configuration
dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopAtEntry = true,
        -- to view elements of containers (eg. std::vector) while debugging
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
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- Keymaps to start debugger
vim.keymap.set("n", "<leader>db", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>dr", "<Cmd>lua require'dap'.continue()<CR>")

