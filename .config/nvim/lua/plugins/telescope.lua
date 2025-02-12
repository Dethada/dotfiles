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
        keys = {
            { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Telescope Fuzzy File Finder" },
            { "<C-b>", "<cmd>Telescope buffers<cr>", desc = "Telescope Buffers Browser" },
            { "<C-f>", "<cmd>Telescope file_browser<cr>", desc = "Telescope File Browser" },
            { "<C-g>", "<cmd>Telescope live_grep<cr>", desc = "Telescope Live Grep" },
            { "<Leader>g", group = "Telescope Git" },
            { "<Leader>gb", "<cmd>Telescope git_files<cr>", desc = "Git Branches" },
            { "<Leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git Commits" },
            { "<Leader>gf", "<cmd>Telescope git_branches<cr>", desc = "Git files" },
            { "<Leader>gs", "<cmd>Telescope git_stash<cr>", desc = "Git Stash" },
        }
    },
}
