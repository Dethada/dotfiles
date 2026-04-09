return {
    {
        'echasnovski/mini.surround',
        version = false,
        opts = {
            mappings = {
                add = 'sa', -- Add surrounding in Normal and Visual modes
                delete = 'sd', -- Delete surrounding
                highlight = 'sh', -- Highlight surrounding
                replace = 'sr', -- Replace surrounding
              },
        },
    },

    -- more text objects
    {
        'echasnovski/mini.ai',
        version = false,
    },

    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = true
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },

    {
        'mg979/vim-visual-multi',
        branch = 'master',
    },

    {
        'ntpeters/vim-better-whitespace',
        config = function()
            vim.g['strip_whitespace_on_save'] = 1
            vim.g['strip_whitespace_confirm'] = 0
        end,
    },

    {
        'mcauley-penney/visual-whitespace.nvim',
        event = "ModeChanged *:[vV\22]", -- lazy load on entering visual mode
    },

    {
        'github/copilot.vim',
        build = ':Copilot setup',
        event = "InsertEnter",
    },

    {
        'smoka7/hop.nvim',
        version = "*",
        config = function ()
            local hop = require('hop')
            hop.setup { keys = 'etovxqpdygfblzhckisuran' }
            vim.keymap.set('', 'f', function()
                hop.hint_words()
            end, {remap=true})
            vim.keymap.set('', 'F', function()
                hop.hint_lines()
            end, {remap=true})
        end,
    },

    {
        "OXY2DEV/markview.nvim",
        lazy = false
    },

    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        opts = {},
    },
}
