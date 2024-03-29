" ftplugin for Sweave files containing both LaTeX and R code
"
" Maintainer: Johannes Ranke <jranke@uni-bremen.de>
" Last Change: 2006 Mai 24
" SVN: $Id: rnoweb.vim 62 2006-05-24 08:30:59Z ranke $
"
" Usage:
"
" Press <F2> to open a new xterm with a new R interpreter listening
" to its standard input (you can type R commands into the xterm)
" as well as to code pasted from within vim.
"
" A Makefile for producing R noweb files is in included in my Vim script
" R.vim:
" 	http://www.vim.org/scripts/script.php?script_id=1048
" You can also look in my SVN repository under:
" 	http://kri/viewcvs/*checkout*/Makefile.rnoweb?root=vim
"
"
" After selecting a visual block, 'r' sends it to the R interpreter
"
" Add to filetypes.vim, if you don't use vim 7
"   au BufNewFile,BufRead *.Rnw,*.rnw   setf rnoweb
" and/or
"   au BufNewFile,BufRead *.Snw,*.snw   setf rnoweb
"
" Maps:
"       <F2>		Start a listening R interpreter in new xterm
"       <F9>        Run line under cursor
"       r	        Run visual block
"       <M-Enter>   Write and process R code

" Only do this when not yet done for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

"disable backup for .r-pipe
setl backupskip=.*pipe

"Start a listening R interpreter in new xterm
noremap <buffer> <F2> :!xterm -T 'R' -e funnel.pl ~/.r-pipe "R && echo -e 'Interpreter has finished. Exiting. Goodbye.\n'"&<CR><CR>

"send line under cursor to R
noremap <buffer> <F9> :execute line(".") 'w >> ~/.r-pipe'<CR>
inoremap <buffer> <F9> <Esc> :execute line(".") 'w >> ~/.r-pipe'<CR>

"send visual selected block to R
vnoremap <buffer> r :w >> ~/.r-pipe<CR>

"write and process mode (somehow mapping <C-Enter> does not work)
inoremap <M-Enter> <Esc>:execute line(".") 'w >> ~/.r-pipe'<CR>o
