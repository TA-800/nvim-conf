-- https://github.com/numToStr/dotfiles/blob/master/neovim/.config/nvim/lua/numToStr/keybinds.lua
-- Creating a custom function to map keybinds more easily
local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- Make C-b the shortcut to open / close the File explorer
map('n', '<C-b>', '<CMD>NvimTreeToggle<CR>')

-- Telescope mappings
map('n', '<leader>ff', '<CMD>Telescope find_files<CR>')
map('n', '<leader>fg', '<CMD>Telescope live_grep<CR>')

-- Terminal mappings (defined in toggleterm-config)
-- Ctrl + \ to open terminal in normal and insert mode, [number]Ctrl + \ to open numbered terminal (for multiple terms), esc to switch to normal mode in terminal

-- Ctrl + s to save in normal and insert mode
map({ 'i', 'n', 'v' }, '<C-s>', '<CMD>w<CR>')

-- J and K to move up and down 5 lines
map('n', 'J', '5j')
map('n', 'K', '5k')

-- Ctrl + h,j,k,l to move left (one char), down (one line), up (one line), right (one char)
map('i', '<C-h>', '<left>')
map('i', '<C-j>', '<down>')
map('i', '<C-k>', '<up>')
map('i', '<C-l>', '<right>')

-- Leader key + j to join line with line below cursor
map('n', '<leader>j', '<CMD>join<CR>')

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
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>')
map('n', '<A-.>', '<Cmd>BufferNext<CR>')
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>')
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>')
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>')
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>')
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>')
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
