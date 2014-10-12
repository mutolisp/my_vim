set guifont=AR\ PL\ New\ Sung\ 14
set nu!
set bs=2
set cindent
set shiftwidth=8
set enc=utf-8
set fileencodings=utf-8,big5,gbk,sjis,es,euc-jp,euc-kr,utf-bom,iso8859-1
set termencoding=utf-8
set encoding=utf-8
"set softtabstop=4
set hls                
"set sw=2        "
set background=dark
set nomodeline
set ruler
"setlocal spell spelllang=en_us
set complete+=kspell
syntax on
highlight Comment ctermfg=darkcyan
highlight Search term=reverse ctermbg=4 ctermfg=7

"Arduino setup 20140915
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino
" open serial monitor automatically after each deploy
let g:vim_arduino_auto_open_serial = 1
"for pathogen
"
execute pathogen#infect()
"NERDTree
"autocmd vimenter * NERDTree
"vim-markdown
let g:vim_markdown_folding_disabled=1

"set printmbcharset=ETEN
"set printmbfont=r:MOESung-Regular
set printoptions=paper:A4

augroup sgmledit
 autocmd FileType sgml set formatoptions=cq2l " Special formatting options
 autocmd FileType sgml set textwidth=70       " Wrap lines at 70 columns
 autocmd FileType sgml set shiftwidth=2       " Automatically indent
 autocmd FileType sgml set softtabstop=2      " Tab key indents 2 spaces
 autocmd FileType sgml set tabstop=8          " Replace 8 spaces with a tab
 autocmd FileType sgml set autoindent         " Automatic indentation
augroup END

augroup pythonedit
 set tabstop=4
 set softtabstop=4
 set shiftwidth=4
 set smarttab
 set expandtab
 set autoindent
augroup END


"let $LANG="zh_TW.UTF-8" " locales
"set encoding=utf-8      " ability
"set fileencoding=big5   " prefer
" charset detect list. ucs-bom must be earlier than ucs*.
"set fileencodings=ascii,ucs-bom,utf-8,ucs-2,ucs-le,sjis,big5,latin1

" for console mode we use big5
"if has("gui_running")
"    set termencoding=utf-8
"  else
"    set termencoding=big5
"endif

" vim:ft=vim
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")
