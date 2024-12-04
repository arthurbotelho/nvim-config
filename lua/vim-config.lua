-- VIM CONFIG
vim.cmd "set number relativenumber"
vim.cmd "set showmode"
vim.cmd "set nowrap"

vim.cmd "set shiftwidth=2"
vim.cmd "set tabstop=2"
vim.cmd "set softtabstop=2"
vim.cmd "set expandtab"
vim.cmd "set textwidth=100"
vim.cmd "set incsearch"
vim.cmd "set hlsearch"

vim.g.mapleader = " "
vim.g.have_nerd_font = "true"

vim.cmd "noremap <Up> <Nop>"
vim.cmd "noremap <Down> <Nop>"
vim.cmd "noremap <Left> <Nop>"
vim.cmd "noremap <Right> <Nop>"
vim.cmd "noremap <A-a> <C-a>"
vim.cmd "nnoremap <A-x> <C-x>"
--Move between buffers
-- vim.cmd("nnoremap <C-J> :bprev<CR>")
-- vim.cmd("nnoremap <C-K> :bnext<CR>")
vim.cmd "nnoremap <leader>s :w<CR>"
