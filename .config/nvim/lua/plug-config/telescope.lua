local telescope_builtin = require('telescope.builtin')

vim.keymap.set('n', '<C-g>', telescope_builtin.live_grep)
vim.keymap.set('n', '<C-b>', telescope_builtin.buffers)
vim.keymap.set('n', '<C-p>', telescope_builtin.find_files)
-- vim.keymap.set('n', '<C-f>', telescope.file_browser)

vim.keymap.set('n', '<leader>gf', telescope_builtin.git_files)
vim.keymap.set('n', '<leader>gc', telescope_builtin.git_commits)
vim.keymap.set('n', '<leader>gb', telescope_builtin.git_branches)
vim.keymap.set('n', '<leader>gs', telescope_builtin.git_stash)
