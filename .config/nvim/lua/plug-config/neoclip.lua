require('neoclip').setup({
    history = 100,
})

require('telescope').load_extension 'neoclip'

local wk = require('which-key')

wk.register({
  ['<SPACE>cb'] = { '<Cmd>Telescope neoclip<CR>', 'Clipboard Manager' },
})
