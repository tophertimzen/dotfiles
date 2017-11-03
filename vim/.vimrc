"vundle
                   
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'majutsushi/tagbar'       

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"generic options
set mouse=a
set number
set paste
syntax enable
set background=dark
set nocompatible
set hidden

"search options
set hlsearch
set incsearch
set ignorecase
set smartcase
hi Search ctermfg=Yellow ctermbg=NONE cterm=bold,underline

set tabstop=4 
set shiftwidth=4
set smartindent
set expandtab
set ai
set si
set wrap

"python settings
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

"key combinations
:nmap <C-N><C-N> :set invnumber<CR>
:nmap <C-P><C-P> :set paste<CR>
:nmap <C-P><C-N> :set nopaste<CR>
inoremap <C-Space> <C-p>
nmap <F8> :TagbarToggle<CR>

"easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"backup files
set undodir=~/.vim/tmp/undo/
set undofile
"set backupdir=~/.vim/tmp/backup/
"set directory=~/.vim/tmp/swap/
set nobackup
set nowb
set noswapfile

set encoding=utf-8

"ctags
set tags=tags;

" Pressing ,ss will toggle and untoggle spell checking
nnoremap <C-C> :setlocal spell!

"" Functions

"automatically chmod+x files that begin with #!/bin*
augroup Executable
au BufWritePost * call MakeExecutable()
augroup END

"make .txt and .md render as markdown
autocmd BufRead,BufNewFile *.txt,*.md set filetype=markdown

function! MakeExecutable()
    if getline(1)=~"^#!.*/bin/"
        silent !chmod a+x <afile>
    endif
endfunction

function ShowSpaces(...)
  let @/='\v(\s+$)|( +\ze\t)'
  let oldhlsearch=&hlsearch
  if !a:0
    let &hlsearch=!&hlsearch
  else
    let &hlsearch=a:1
  end
  return oldhlsearch
endfunction

function TrimSpaces() range
  let oldhlsearch=ShowSpaces(1)
  execute a:firstline.",".a:lastline."substitute ///gec"
  let &hlsearch=oldhlsearch
endfunction

command -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()

" Delete trailing white space on file save
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

autocmd BufWritePre *.txt,*.js,*.py,*.sh,*.md :call CleanExtraSpaces()
