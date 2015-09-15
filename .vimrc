
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

" Search for visually selected text
" http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap // y/<C-R>"<CR>

" Cleanup aka remove whitespace
map gc :%s/\s\+$//

" :w!! fast and then l to reload the saved file
cmap w!! %!sudo tee > /dev/null %

" Get the current filename
:nmap cp :let @" = expand("%") <CR>

" Shift print scrn creates a pdf with filename.pdf in cwd
" :help :map-special-keys
:nmap <S-t_%9> :hardcopy > %:t.ps <CR> :!ps2pdf %:t.ps <CR> 

" Build and view src
nmap <F7> :make<CR>
"nmap <F7> :make \| copen<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :NERDTreeToggle<CR>

"nmap <F12> :set mp:build.sh\ -c \| make \| copen

" Add the GPL fileheader
:nmap gpl :read ~/.vim/license/gpl.txt <CR>
:nmap agpl :read ~/.vim/license/agpl.txt <CR>

set tags=tags;/
nmap <F1> :exe 'tjump ' . expand('<cword>')<CR>
nmap <F2> :exe 'tag ' . expand('<cword>')<CR>

filetype plugin indent on
