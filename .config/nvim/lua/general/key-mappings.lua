vim.keymap.set('n', '<Leader>t', '<Cmd>StripWhitespace<CR>')

-- move lines up and down with formatting
vim.keymap.set('v', 'J', [[:m '>+1<CR>gv=gv]])
vim.keymap.set('v', 'K', [[:m '<-2<CR>gv=gv]])

-- better indentation
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- better pane navigation
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')

-- horizontal resize
vim.keymap.set('n', '<C-S-Up>', '<Cmd>resize +5<CR>', {silent = true})
vim.keymap.set('n', '<C-S-Down>', '<Cmd>resize -5<CR>', {silent = true})

-- vertical resize
vim.keymap.set('n', '<C-S-Left>', '<Cmd>vertical resize +5<CR>', {silent = true})
vim.keymap.set('n', '<C-S-Right>', '<Cmd>vertical resize -5<CR>', {silent = true})

-- undo highlight from search
vim.keymap.set('n', '<F6>', [[<Cmd>let @/=""<CR>]], {silent = true})

-- buffer cycling with tab
vim.keymap.set('n', '<Tab>', '<Cmd>bnext<CR>')
vim.keymap.set('n', '<S-Tab>', '<Cmd>bprevious<CR>')


-- close buffer while keeping window open
-- vim.keymap.set('n', '<Leader>q', '<Cmd>bp|bd #<CR>')
