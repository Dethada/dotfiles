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

    -- hex color preview
    {
        'brenoprata10/nvim-highlight-colors',
        config = function()
            require('nvim-highlight-colors').setup()
        end,
    },

    {
        'nvim-tree/nvim-web-devicons',
        lazy = true,
    },
}
