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
        branch = 'master',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            branch = 'master'
        },
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                -- A list of parser names, or "all"
                ensure_installed = "all",

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- List of parsers to ignore installing (for "all")
                -- phpdoc and tree-sitter-phpdoc errors on m1
                -- use vimtex syntax highlighter for vimtex features
                ignore_install = { 'phpdoc', 'tree-sitter-phpdoc', 'latex', 'ipkg' },

                highlight = {
                    -- `false` will disable the whole extension
                    enable = true,

                    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
                    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
                    -- the name of the parser)
                    -- list of language that will be disabled
                    --[[ disable = { "c", "rust" }, ]]

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },

                indent = {
                    enable = true
                },

                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<CR>",
                        node_incremental = "<CR>",
                        node_decremental = "<BS>",
                        scope_incremental = "grc",
                    },
                },

                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
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
                        },
                    }
                },
            })
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
