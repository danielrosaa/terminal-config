syntax on		        " Enable syntax highlighting
set number		        " Show line numbers
set relativenumber	    " Show relative line numbers
set tabstop=4		    " Set tab width to 4 spaces
set shiftwidth=4	    " Set indentation width to 4 spaces
set expandtab		    " Uses spaces instead if tabs
set cursorline		    " Highlight the current line

" Sync clipboard with OS
set clipboard=unnamedplus
" Set vim backup location files
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

if has('nvim')
    source ~/.config/nvim/init.lua
    finish
endif
