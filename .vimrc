set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on " required for vundle

syntax on
" set nowrap
set encoding=utf8

map <C-n> :NERDTreeToggle<CR>

set background=dark
" set shortmess=at

" can add .vimrc per directory
set exrc
set secure

" spacing
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

set laststatus=2
" set colorcolumn=80
" highlight ColorColumn ctermbg=darkgray

augroup cpp
    autocmd!
    autocmd BufRead,BufNewFile *.h,*.cpp set filetype=cpp.doxygen
augroup END
