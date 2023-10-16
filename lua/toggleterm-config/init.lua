require("toggleterm").setup{
  open_mapping = [[<c-\>]],
  start_in_insert = true,
}

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)-- jk to enter normal mode while in term
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- https://github.com/akinsho/toggleterm.nvim#custom-terminal-usage
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", direction = "float", hidden = true })

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>gg", "<CMD>lua _LAZYGIT_TOGGLE()<CR>", {noremap = true, silent = true})
