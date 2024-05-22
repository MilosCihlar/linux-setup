" ---number---
set number
set relativenumber

" ---general---
set title
syntax enable
set cursorline

"set cursorcolumn

" ---searching---
set ignorecase
set smartcase
set hlsearch
set incsearch

" ---indention---
set expandtab                   " tab inserts spaces
set shiftwidth=2
set softtabstop=2
set autoindent                  " copy the indention from the last line
set smartindent                 " sometimes indent extra indention
set tabstop=2                   " width of the tab character
set scrolloff=10                " ads cursor margin for the edge of the page

set nocompatible
filetype off

" ---system clipboard---"

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'

" Add plugins here


call vundle#end()
filetype plugin indent on

" YCM settings
let g:ycm_max_num_candidates = 5
let g:ycm_warning_symbol = '>'
let g:ycm_confirm_extra_conf = 0
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_max_diagnostics_to_display = 0  " Reference:
" https://github.com/ycm-core/YouCompleteMe/issues/2392

" YCM Error & Warning Color Scheme
" https://jonasjacek.github.io/colors/
hi YcmErrorSection ctermbg=0 cterm=underline
hi YcmWarningSection ctermbg=0 cterm=underline
