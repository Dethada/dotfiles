return {
    {
        'lervag/vimtex',
        lazy = false,     -- we don't want to lazy load VimTeX
        init = function()
            vim.g['tex_flavor'] = 'latex'

            -- Viewer options: One may configure the viewer either by specifying a built-in
            -- viewer method:
            vim.g['vimtex_view_method'] = 'zathura'

            -- set build directory
            vim.g['vimtex_compiler_latexmk'] = { build_dir = 'build'}
        end
    },
}
