return {
    {
        'echasnovski/mini.surround',
        version = false,
        opts = {
            mappings = {
                add = 'sa', -- Add surrounding in Normal and Visual modes
                delete = 'sd', -- Delete surrounding
                find = 'sf', -- Find surrounding (to the right)
                find_left = 'sF', -- Find surrounding (to the left)
                highlight = 'sh', -- Highlight surrounding
                replace = 'sr', -- Replace surrounding
                update_n_lines = 'sn', -- Update `n_lines`
                suffix_last = 'l', -- Suffix to search with "prev" method
                suffix_next = 'n', -- Suffix to search with "next" method
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
        'mbbill/undotree',
        config = function()
            vim.g['undotree_WindowLayout'] = 3
            vim.g['undotree_SetFocusWhenToggle'] = 1
            vim.g['undotree_ShortIndicators'] = 1

            local wk = require('which-key')

            wk.add({
                { "<space>u", "<Cmd>UndotreeToggle<CR>", desc = "Undotree Toggle" },
            })
        end,
    },

    {
        'ntpeters/vim-better-whitespace',
        config = function()
            vim.g['strip_whitespace_on_save'] = 1
            vim.g['strip_whitespace_confirm'] = 0
        end,
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
}
