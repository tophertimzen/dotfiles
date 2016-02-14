"generic options
set mouse-=a
set number
set paste
syntax enable
set background=dark
set nocompatible             

"Solarized and overwrite GNOME terminal
:set t_Co=256
colorscheme solarized

"search options
set hlsearch
set incsearch
set ignorecase
set smartcase 
hi Search ctermfg=Yellow ctermbg=NONE cterm=bold,underline

set tabstop=4 shiftwidth=4
set smartindent
set expandtab
set cursorline

"python settings
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

"key combinations
:nmap <C-N><C-N> :set invnumber<CR>

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

function! MakeExecutable()
	if getline(1)=~"^#!.*/bin/"
		silent !chmod a+x <afile>
	endif
endfunction
