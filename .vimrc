map <Up> gk
map <Down> gj

set nobackup
set nowritebackup
set notitle

set ai
set noaw
set noic
set nonu
set noerrorbells
set visualbell t_vb=
set nomesg
set wrapmargin=0
set nows
set nojoinspaces

" Kill all colorization
syntax off
set nohlsearch
" set t_Co=0

set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab
autocmd FileType make set noexpandtab shiftwidth=8 sts=8
" autocmd Filetype javascript setlocal sts=2 sw=2
autocmd Filetype python setlocal sts=4 sw=4
set matchpairs=(:),{:},[:],<:>

" FROM: http://www.vim.org/tips/tip.php?tip_id=330
" set nocindent
" set nosmartindent
" set noautoindent
" set indenexpr=
" filetype indent off
" filetype plugin indent off

set nocindent
set nosmartindent
" set indenexpr=
filetype indent off
filetype plugin indent off

set autoindent

source $HOME/.vim/cscope_maps.vim

" C indent stuff
setlocal cinoptions=:0l1

" From Bram:
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" DF - Also do not do this if the file resides in the $TEMP directory,
" chances are it is a different file with the same name.
" This comes from the $VIMRUNTIME/vimrc_example.vim file 
autocmd BufReadPost *
  \ if expand("<afile>:p:h") !=? $TEMP |
  \   if line("'\"") > 0 && line("'\"") <= line("$") |
  \     exe "normal g`\"" |
  \     let b:doopenfold = 1 |
  \   endif |
  \ endif
" Need to postpone using "zv" until after reading the modelines.
autocmd BufWinEnter *
  \ if exists("b:doopenfold") |
  \   unlet b:doopenfold |
  \   exe "normal zv" |
  \ endif 
