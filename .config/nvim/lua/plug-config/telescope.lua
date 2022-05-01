local telescope_builtin = require('telescope.builtin')
local telescope_extensions = require('telescope').extensions
local wk = require('which-key')

wk.register({
    ['<C-p>'] = { telescope_builtin.find_files, 'Telescope Fuzzy File Finder' },
    ['<C-b>'] = { telescope_builtin.buffers, 'Telescope Buffers Browser' },
    ['<C-f>'] = { telescope_extensions.file_browser.file_browser, 'Telescope File Browser' },
    ['<C-g>'] = { telescope_builtin.live_grep, 'Telescope Live Grep' },
})

wk.register({
    g = {
        name = 'Telescope Git',
        f = { telescope_builtin.git_files, 'Git files' },
        c = { telescope_builtin.git_commits, 'Git Commits' },
        b = { telescope_builtin.git_branches, 'Git Branches' },
        s = { telescope_builtin.git_stash, 'Git Stash' },
    },
}, { prefix = '<Leader>' })
