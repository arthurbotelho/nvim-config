-- VIM CONFIG
vim.cmd("set number relativenumber")
vim.cmd("set showmode")
vim.cmd("set nowrap")

vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=4")
vim.cmd("set expandtab")
vim.cmd("set incsearch")
vim.cmd("set hlsearch")

vim.cmd("noremap <Up> <Nop>")
vim.cmd("noremap <Down> <Nop>")
vim.cmd("noremap <Left> <Nop>")
vim.cmd("noremap <Right> <Nop>")

--Move between buffers
vim.cmd("nnoremap <C-J> :bprev<CR>")
vim.cmd("nnoremap <C-K> :bnext<CR>")
vim.cmd("nnoremap <C-s> :w<CR>")

