return {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui"
    },
    event = "VeryLazy",
    config = function()
        require("mason-nvim-dap").setup({ handlers = {} })
    end
}
