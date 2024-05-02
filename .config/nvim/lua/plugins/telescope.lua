return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'folke/which-key.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = vim.fn.executable('make') == 1
            },
        },
        config = function()
            local telescope_builtin = require('telescope.builtin')
            local telescope_extensions = require('telescope').extensions
            local wk = require('which-key')

            -- Enable telescope fzf native, if installed
            pcall(require('telescope').load_extension, 'fzf')

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
        end,
    },
}
