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
set mouse-=a
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

set tabstop=4 shiftwidth=4
set smartindent
set expandtab

"python settings
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

"key combinations
:nmap <C-N><C-N> :set invnumber<CR>
inoremap <C-Space> <C-p>
nmap <F8> :TagbarToggle<CR>

"backup files
set undodir=~/.vim/tmp/undo/
set backupdir=~/.vim/tmp/backup/
set directory=~/.vim/tmp/swap/
set backup
set encoding=utf-8

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
