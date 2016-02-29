"generic options
set mouse-=a
set number
set paste
syntax enable
set background=dark
set nocompatible             
filetype off
set clipboard=unnamed

"vundle stuff
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Autocompletion
Plugin 'valloric/YouCompleteMe'
"File browser
Plugin 'scrooloose/nerdtree'

call vundle#end()            " required
filetype plugin indent on    " required

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


"backup files
set undodir=~/.vim/tmp/undo/
set undofile
set backupdir=~/.vim/tmp/backup/
set backup
set directory=~/.vim/tmp/swap/
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

"Window splitting
set splitbelow
set splitright

"key combinations
nnoremap <C-J> <C-W><C-J> 
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L> 
nnoremap <C-H> <C-W><C-H> 
:nmap <C-N><C-N> :set invnumber<CR>
map <F2> :NERDTreeToggle<CR>

"YCM
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-m>', '<Up>']
let g:SuperTabDefaultCompletionType = '<Tab>'
" Goto definition with F3
map <F3> :YcmCompleter GoTo<CR>
