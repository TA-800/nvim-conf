require("toggleterm").setup {
  open_mapping = [[<c-\>]],
  start_in_insert = true,
}

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- https://github.com/akinsho/toggleterm.nvim#custom-terminal-usage
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "float",
  -- https://github.com/akinsho/toggleterm.nvim/issues/34#issuecomment-966292397
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(0, "t", '<esc>', "<cmd>close<CR>", {silent = false, noremap = true})
    if vim.fn.mapcheck("<esc>", "t") ~= "" then
      vim.api.nvim_buf_del_keymap(term.bufnr, "t", "<esc>")
    end
  end,
})

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

-- Setting keybind
vim.api.nvim_set_keymap("n", "<leader>gg", "<CMD>lua _LAZYGIT_TOGGLE()<CR>", { noremap = true, silent = true })
