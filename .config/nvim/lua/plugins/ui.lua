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
        opts = {
            options = { theme = 'palenight' },
            sections = {
                lualine_x = {
                    function()
                        local clients = vim.lsp.get_clients({ bufnr = 0 })
                        if #clients == 0 then
                            return ''
                        end
                        local names = {}
                        for _, client in ipairs(clients) do
                            names[#names + 1] = client.name
                        end
                        return table.concat(names, ', ')
                    end,
                    'encoding',
                    'fileformat',
                    'filetype',
                },
            },
        },
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
