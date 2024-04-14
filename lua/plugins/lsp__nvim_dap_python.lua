local config = function()
    local path = "C:\\Users\\taher\\AppData\\Local\\nvim-data\\mason\\packages\\debugpy\\venv\\Scripts\\python"

    require("dap-python").setup(path)
end

return {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
    event = "VeryLazy",
    config = config
}
