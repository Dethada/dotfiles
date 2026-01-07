return {
    {
        'neovim/nvim-lspconfig',

        dependencies = {
            {
                'mason-org/mason.nvim',
                config = true,
            },
            'mason-org/mason-lspconfig.nvim',
            'saghen/blink.cmp',
        },
        config = function()
            -- 1. Setup Mason
            require('mason').setup()
            require('mason-lspconfig').setup({
                automatic_installation = true,
            })

            -- 2. Global Diagnostic Mappings
            vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
            vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
            vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
            vim.keymap.set('n', '<space>dd', '<cmd>Telescope diagnostics<CR>')

            -- 3. LSP Keymaps (using LspAttach for efficiency)
            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    local opts = { buffer = ev.buf }
                    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', '<space>f', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)
                end,
            })

            -- 4. Enable Servers using the new Neovim 0.11 API
            -- This replaces require('lspconfig')[server].setup()
            local capabilities = require('blink.cmp').get_lsp_capabilities()
            local servers = {
                'lua_ls', 'rust_analyzer', 'pyright',
                'ts_ls', 'clangd', 'jdtls', 'gopls'
            }

            for _, server_name in ipairs(servers) do
                -- Use the new native enable function
                vim.lsp.enable(server_name, {
                    capabilities = capabilities,
                })
            end
        end,
    },
}
