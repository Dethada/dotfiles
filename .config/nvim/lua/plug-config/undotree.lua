vim.g['undotree_WindowLayout'] = 3
vim.g['undotree_SetFocusWhenToggle'] = 1
vim.g['undotree_ShortIndicators'] = 1

local wk = require('which-key')

wk.register({
  ["<leader>u"] = { '<Cmd>UndotreeToggle<CR>', 'Undotree Toggle' },
})
