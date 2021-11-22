require'hop'.setup()

vim.api.nvim_set_keymap('n', '<leader>hw', "<cmd>lua require'hop'.hint_words()<cr>", {})
vim.api.nvim_set_keymap('n', '<leader>hl', "<cmd>lua require'hop'.hint_lines()<cr>", {})
