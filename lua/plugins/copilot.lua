 return {
    -- Lazy load copilot as it takes time to connect to server, need to define config function here
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            suggestion = {
                auto_trigger = true
            }
        })
    end
}
