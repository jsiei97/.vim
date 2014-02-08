
"if filereadable("/etc/vim/vimrc")
"  source /etc/vim/vimrc
"endif


set nocompatible
syntax enable

let tabsize = 4
execute "set tabstop=".tabsize
execute "set shiftwidth=".tabsize
execute "set softtabstop=".tabsize

set expandtab
"set smartindent
"set autoindent

set ignorecase

" Arduino as C++ files
autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

"set dir=~/.vim_tmp
"set backupdir=~/.vim_tmp

" :%s for search and replace is hard to type
" lets map them to gs...
map gs :%s///gc

" Cleanup aka remove whitespace
map gc :%s/\s\+$//

" :w!! fast and then l to reload the saved file
cmap w!! %!sudo tee > /dev/null %

" Get the current filename
:nmap cp :let @" = expand("%") <CR>

" Build and view src
nmap <F7> :make<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :NERDTreeToggle<CR>


" Add the GPL fileheader
:nmap gpl :read ~/.vim/license/gpl.txt <CR>

set tags=tags;/
nmap <F1> :exe 'tjump ' . expand('<cword>')<CR>
nmap <F2> :exe 'tag ' . expand('<cword>')<CR>

filetype plugin indent on