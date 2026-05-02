return {
    -- indentation line guide
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {
            enabled = true,
            scope = { enabled = true },
        },
    },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        version = false,
        branch = 'main',
        lazy = false,
        build = ':TSUpdate',
        config = function()
            local ts_langs = { 'bash', 'c', 'cpp', 'rust', 'python', 'powershell', 'lua', 'llvm', 'yaml', 'toml', 'json', 'markdown' }
            require('nvim-treesitter').install(ts_langs)

            vim.api.nvim_create_autocmd('FileType', {
                pattern = ts_langs,
                callback = function()
                    vim.treesitter.start()
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })

            -- incremental selection with <CR>
            vim.keymap.set('n', '<CR>', 'van', { remap = true })
            vim.keymap.set('x', '<CR>', 'an', { remap = true })
            vim.keymap.set('x', '<BS>', 'in', { remap = true })
            vim.keymap.set({ 'n', 'x' }, 'grc', ']n', { remap = true })
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = 'main',
        init = function()
            vim.g.no_plugin_maps = true
        end,
        config = function()
            require("nvim-treesitter-textobjects").setup {
                select = {
                    lookahead = true,
                    include_surrounding_whitespace = false,
                },
            }

            local select = require("nvim-treesitter-textobjects.select")
            local keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["aC"] = "@class.outer",
                ["iC"] = "@class.inner",
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
                ["acl"] = "@call.outer",
                ["icl"] = "@call.inner",
                ["acd"] = "@conditional.outer",
                ["icd"] = "@conditional.inner",
            }
            for lhs, capture in pairs(keymaps) do
                vim.keymap.set({ "x", "o" }, lhs, function()
                    select.select_textobject(capture, "textobjects")
                end)
            end
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter-context',
        enabled = true,
        opts = {
            mode = 'cursor',
            max_lines = 3,
        },
    },

    {
        'JoosepAlviste/nvim-ts-context-commentstring',
    },

    -- Show symbols in file
    {
        'stevearc/aerial.nvim',
        opts = {},
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("aerial").setup({
                -- Priority list of preferred backends for aerial.
                backends = {  "lsp", "treesitter", "markdown", "asciidoc", "man" },

                default_direction = "prefer_right",

                -- show all kinds of symbols
                filter_kind = false,
            })

            vim.keymap.set("n", "<space>t", "<cmd>AerialNavToggle<CR>")
        end,
    },

    -- Git stuff
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                current_line_blame = true,
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    vim.keymap.set('n', '<leader>gb', function()
                        -- Close if already open
                        for _, winid in ipairs(vim.api.nvim_list_wins()) do
                            if vim.w[winid].gitsigns_preview == 'blame' then
                                vim.api.nvim_win_close(winid, true)
                                return
                            end
                        end
                        -- Open and focus
                        gs.blame_line({ full = true })
                        vim.defer_fn(function()
                            for _, winid in ipairs(vim.api.nvim_list_wins()) do
                                if vim.w[winid].gitsigns_preview == 'blame' then
                                    vim.api.nvim_set_current_win(winid)
                                    break
                                end
                            end
                        end, 100)
                    end)
                end
            })
        end,
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
}
