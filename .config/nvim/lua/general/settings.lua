vim.g.mapleader = ','
vim.o.encoding = 'utf-8'

-- line number
vim.o.number = true
vim.o.relativenumber = true

-- use system clipboard
vim.o.clipboard = 'unnamedplus'

-- enable true terminal colors
vim.o.termguicolors = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true -- tabs are space
-- vim.o.copyindent = true -- copy indentation from the previous line
vim.o.smartindent = true
vim.o.hidden = true -- allow switching from modified buffers
vim.o.ignorecase = true -- ignore case when searching
vim.o.smartcase = true -- case insensitive search until caps is used
vim.o.scrolloff = 20 -- start scrolling when cursor is n lines away from btm
vim.o.signcolumn = 'yes' -- extra column for git status
vim.o.updatetime = 1000 -- number of ms for vim to update swap file (for plugins like gitgutter)
-- vim.o.swapfile = false -- disable swap files
vim.o.undofile = true -- store undos persistently on disk (~/.local/share/nvim/undo/)
vim.o.laststatus = 3 -- global status line
vim.o.list = true
vim.o.listchars = 'tab:»-,extends:>,precedes:<,nbsp:·,trail:·'
vim.o.colorcolumn = 100
vim.o.textwidth = 100
vim.o.splitbelow = true -- force all horizontal splits to go below current windows
vim.o.splitright = true -- force all vertical splits to go to the right of current window

-- use windows clipboard if in wsl
if vim.fn.has('wsl') == 1 then
    local yankGrp = vim.api.nvim_create_augroup('Yank', { clear = true })
    vim.api.nvim_create_autocmd('TextYankPost', {
        command = [[call system('/mnt/c/windows/system32/clip.exe ',@")]],
        group = yankGrp,
    })
end
