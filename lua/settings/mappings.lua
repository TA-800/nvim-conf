-- helper function to map keys
local function map(mode, key, action, opts)
    -- combine opts with silent = true (if opts was passed)
    local options = vim.tbl_extend("keep", { silent = true }, opts or {})
    vim.keymap.set(mode, key, action, options)
end

-- Windows Terminal keymaps - https://learn.microsoft.com/en-us/windows/terminal/panes#closing-a-pane
-- Alt + Shift + +/- = New horizontal/Vertical pane
-- Alt + Shift + ArrowKey = Resize selected pane
-- Ctrl + Shift + W = Close pane
-- Alt + ArrowKey = Move between panes
-- Ctrl + Shift + P = Command Palette -> type "zoom" to select "Toggle Pane Zoom"

-- Mini.Files (file explorer)
map("n", "<C-b>", "<CMD>lua MiniFiles.open()<CR>")

-- Ctrl + h,j,k,l to move left (one char), down (one line), up (one line), right (one char)
map("i", '<C-h>', '<left>')
map("i", '<C-j>', '<down>')
map("i", '<C-k>', '<up>')
map("i", '<C-l>', '<right>')

-- Shift Left, Up, Right, Down to increase / decrease window sizes (widths / heights)
map("n", "<S-Left>", "<CMD>vertical resize -1<CR>")
map("n", "<S-Right>", "<CMD>vertical resize +1<CR>")
map("n", "<S-Down>", "<CMD>resize -1<CR>")
map("n", "<S-Up>", "<CMD>resize +1<CR>")
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- From ThePrimeagen 0 to LSP video
-- J and K during visual mode to move up and down selected lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Prevent indenting with < and > to remove visual selection
map("v", "<", "<gv")
map("v", ">", ">gv")

-- When moving around with C-d or C-u or search, keep cursor / screen centered.
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Change <C-c> to <Esc> because visual block insert doesn't work with <C-c>
map("i", "<C-c>", "<Esc>")
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- Keybinds for barbar.nvim (tabline)
-- Move to previous/next
map("n", '<A-,>', '<Cmd>BufferPrevious<CR>')
map("n", '<A-.>', '<Cmd>BufferNext<CR>')
-- Close buffer
map("n", '<A-c>', '<Cmd>BufferClose<CR>')
-- Re-order to previous/next
map("n", '<A-<>', '<Cmd>BufferMovePrevious<CR>')
map("n", '<A->>', '<Cmd>BufferMoveNext<CR>')
-- Pin/unpin buffer
map("n", '<A-p>', '<Cmd>BufferPin<CR>')
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map("n", '<C-p>', '<Cmd>BufferPick<CR>')

-- FZF
map("n", '<leader>ff', "<CMD>FzfLua files<CR>")
map("n", '<leader>fg', "<CMD>FzfLua live_grep_native<CR>")
map("n", '<leader>fd', "<CMD>FzfLua lsp_workspace_diagnostics<CR>")
map("n", '<leader>fs', "<CMD>FzfLua lsp_document_symbols<CR>")
map("n", "gr", "<CMD>FzfLua lsp_references<CR>")
map("n", "gp", "<CMD>FzfLua lsp_definitions<CR>")


-- Nvim Possession (session manager)
map("n", '<leader>sl', "<CMD>lua require('nvim-possession').list()<CR>")

-- LSP
map("n", '<space>e', "<CMD>lua vim.diagnostic.open_float()<CR>")

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        map('n', 'gd', vim.lsp.buf.definition, opts)
        map('n', '<space>rn', vim.lsp.buf.rename, opts)
        map({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        map('i', '<c-u>', vim.lsp.buf.signature_help, opts) -- Original <c-k>, now u

        -- Enable inlay hints on startup if the server supports it
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, nil)
        end
    end,

    -- LSP textobjects (preview func, var, class) in nvim_treesitter.lua
})

-- DAP
map("n", "<leader>db", "<CMD>DapToggleBreakpoint<CR>")
map("n", "<leader>dc", "<CMD>DapContinue<CR>")
map("n", "<leader>dn", "<CMD>DapStepOver<CR>")
map("n", "<leader>ds", "<CMD>DapStepInto<CR>")
map("n", "<leader>dq", "<CMD>DapTerminate<CR>")

----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
