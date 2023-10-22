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
-- Ctrl + \ to open terminal in normal and insert mode, [count]Ctrl + \ to open numbered terminal (for multiple terms), esc to switch to normal mode in terminal

-- Ctrl + s to save in normal and insert mode
map({ 'i', 'n', 'v' }, '<C-s>', '<CMD>w<CR>')
-- Ctrl + a to select all in insert mode
map('i', '<C-a>', '<CMD>normal! ggVG<CR>')

-- J and K to move up and down 5 lines
map('n', 'J', '5j')
map('n', 'K', '5k')

-- Insert mode common typing keybinds
-- Ctrl + h,j,k,l to move left (one char), down (one line), up (one line), right (one char)
map('i', '<C-h>', '<left>')
map('i', '<C-j>', '<down>')
map('i', '<C-k>', '<up>')
map('i', '<C-l>', '<right>')

-- Leader key + j to join line with line below cursor
map('n', '<leader>j', '<CMD>join<CR>')

-- Search visually selected text
map('v', '/', "\"fy/\\V<C-R>f<CR>")
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

-- With cursor on a word, press leader-s to search and type btwn the slashes to replace all instances
-- of the word with the word typed
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
-- Keybinds for barbar.nvim (tabline)
-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>')
map('n', '<A-.>', '<Cmd>BufferNext<CR>')
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>')
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>')
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>')
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>')
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>')
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>')
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>')
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>')
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>')
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>')
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>')
map('n', '<A-0>', '<Cmd>BufferLast<CR>')
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>')
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>')
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
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>')
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>')
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>')
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>')
----------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------
