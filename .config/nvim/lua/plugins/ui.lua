return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        config = function ()
            vim.cmd.colorscheme 'catppuccin-macchiato'
        end,
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    -- smooth scrolling
    {
        'karb94/neoscroll.nvim',
        config = function ()
            require('neoscroll').setup {}
        end
    },

    -- hex color preview
    {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    },

    {
        'nvim-tree/nvim-web-devicons',
        lazy = true,
    },
}
