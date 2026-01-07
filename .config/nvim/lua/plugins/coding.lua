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

    -- Automatically add closing tags for HTML and JSX
    {
        'windwp/nvim-ts-autotag',
        opts = {},
    },

    {
        'majutsushi/tagbar',
        config = function()
            local wk = require('which-key')

        wk.add({
            { "<space>t", "<Cmd>TagbarToggle<CR>", desc = "Tagbar Toggle" },
        })
        end,
    },

    -- Git stuff
    {
        'lewis6991/gitsigns.nvim',
        opts = {},
    },
}
