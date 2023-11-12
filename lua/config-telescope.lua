require("telescope").setup({
    extensions = {
        undo = {
            side_by_side = true,
            layout_strategy = "horizontal",
            layout_config = {
                preview_height = 0.8,
            },
        },
    },
})
require("telescope").load_extension("undo")

