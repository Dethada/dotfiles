local hop = require('hop')
hop.setup()

local wk = require('which-key')

wk.register({
    h = {
        name = '+Hop',
        w = {hop.hint_words, 'Hop to word'},
        l = {hop.hint_lines, 'Hop to line'},
    },
}, { prefix = '<space>' })

-- vim.api.nvim_set_keymap('n', '<leader>hw', "<cmd>lua require'hop'.hint_words()<cr>", {})
-- vim.api.nvim_set_keymap('n', '<leader>hl', "<cmd>lua require'hop'.hint_lines()<cr>", {})
