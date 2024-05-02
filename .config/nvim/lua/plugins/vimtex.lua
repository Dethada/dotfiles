return {
    {
        'lervag/vimtex',
        lazy = false,     -- we don't want to lazy load VimTeX
        init = function()
            vim.g['tex_flavor'] = 'latex'

            -- Viewer options: One may configure the viewer either by specifying a built-in
            -- viewer method:
            vim.g['vimtex_view_method'] = 'skim'

            -- automatic forward focus after compiling
            vim.g['vimtex_view_skim_activate'] = 1
            vim.g['vimtex_view_skim_sync'] = 1

            -- set build directory
            vim.g['vimtex_compiler_latexmk'] = { build_dir = 'build'}

            -- Most VimTeX mappings rely on localleader and this can be changed with the
            -- following line. The default is usually fine and is the symbol "\".
            -- vim.cmd('let maplocalleader = ","')
        end
    },
}
